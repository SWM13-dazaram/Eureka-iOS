//
//  KakaoOauth.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/10.
//


import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import AuthenticationServices

class Oauth: ObservableObject {
    @Published var success: Bool? = false
    
    func kakaoLogin(){
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    //do something
                    guard let token = oauthToken else{
                        return
                    }
                    print("token value : \(token.accessToken)")
                    self.success = true
                }
            }
        }
        else{
            print("This User doesn't have KaKaoTalk")
        }
    }
    
    func kakaoLogout(){
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
    
    func kakaoResign(){
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")
            }
        }
    }
    
    func appleLogin(){
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.performRequests()
    }
    
    func logout(){
        //if 카카오 로그인 { kakaoLogout() }
        //else { appleLogout() }
    }
    
    func resign(){
        //if 카카오 로그인 { kakaoResign() }
        //else { appleResign() }
        
    }
}

