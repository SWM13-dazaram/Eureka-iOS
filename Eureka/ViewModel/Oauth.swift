
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import AuthenticationServices
import Moya

class Oauth: ObservableObject {
    let provider = MoyaProvider<UserAPI>()
    @Published var status = UserDefaults.loginStatus()
    
    func kakaoLogin(){
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    guard let token = oauthToken?.accessToken else{
                        return
                    }
                    self.signin(token: token, loginProvider: .KAKAO)
                }
            }
        }
        else{
            print("User doesn't have kakaotalk")
        }
    }
    
    func signin(token: String, loginProvider: LoginProvider){
        let signinInfo = SigninInfo(token: token, provider: loginProvider)
        provider.request(.signin(data: signinInfo)) { response in
            switch response {
            case .success(let result):
                do{
                    print("signin with \(signinInfo.providerType)")
                    let data = try JSONDecoder().decode(JWT.self, from: result.data)
                    print("💡jwt token data: \(data)")
                    
                    
//                    if data.statusCode == 201 {
//                        print("New User!")
//                    }
//                    else if data.statusCode == 200 {
//                        print("Already Signin User")
//                    }
//                    else{
//                        print("Some Unknown Error")
//                    }
                    UserDefaults.setToken(data.jwt)
                    UserDefaults.setProvider(loginProvider)
                    UserDefaults.setLoginStatus(true)
                    self.status = true
                }catch(let err){
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func login() -> Bool{
        return UserDefaults.loginStatus()
    }
    
    func logout(){
        UserDefaults.setLoginStatus(false)
    }

    func resign(){
        // TODO: API
        UserDefaults.removeAll()
        status = false
        }
    
    func appleLogin(){
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.performRequests()
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIdCredential as ASAuthorizationAppleIDCredential:
            if let _ = appleIdCredential.email, let _ = appleIdCredential.fullName {
                print("0️⃣ 최초로그인 (회원가입)")
                print(appleIdCredential)
                print(appleIdCredential.identityToken?.description ?? "no Token")
//                self.signin(token: appleIdCredential.identityToken, loginProvider: .APPLE)
                
            } else {
                print("1️⃣ 재로그인")
                
            }
        default:
            break
        }
    }
}

