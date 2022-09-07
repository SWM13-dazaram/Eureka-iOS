
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
            withoutKaKaoTalk()
        }
    }
    
    func withoutKaKaoTalk(){
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    guard let token = oauthToken?.accessToken else {
                        return
                    }
                    self.signin(token: token, loginProvider: .KAKAO)
                    
                }
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
    
//    func appleLogin(){
//        let request = ASAuthorizationAppleIDProvider().createRequest()
//        request.requestedScopes = [.fullName, .email]
//
//        appleDelegate = SignInWithAppleDelegate() { success in
//            if
//        }
//
//        let controller = ASAuthorizationController(authorizationRequests: [request])
//        controller.delegate = SignInWithAppleDelegate
//
//        controller.performRequests()
//
//    }
    
}
