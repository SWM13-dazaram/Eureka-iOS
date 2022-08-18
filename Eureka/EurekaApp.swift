//
//  EurekaApp.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/11.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct EurekaApp: App {
    
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: Bundle.main.KAKAO_API_KEY)
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL{ url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
                .environmentObject(MockVM()) // mockAPI
                .environmentObject(AddIngredient())
                .environmentObject(IngredientVM())
                .environmentObject(Oauth())
        }
    }
}
