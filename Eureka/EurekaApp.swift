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
    @State var splash = true
    
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: Bundle.main.KAKAO_API_KEY)
        }
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .onOpenURL{ url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
//                .environmentObject(MockVM()) // mockAPI
                .environmentObject(AddIngredientViewModel())
//                .environmentObject(IngredientVM())
                .environmentObject(LoginViewModel.shared)
                .environmentObject(TabSelector())
        }
    }
}
