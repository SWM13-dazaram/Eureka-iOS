//
//  KakaoOauth.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/10.
//


// 카카오톡 설치 여부 확인
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class KakaoLogin {
    
    func login(){
        
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
    }
}

