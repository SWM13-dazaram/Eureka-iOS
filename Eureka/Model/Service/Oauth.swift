//
//  KakaoOauth.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/10.
//


import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

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
    }
    
    func appleLogin(){
        
    }
}

