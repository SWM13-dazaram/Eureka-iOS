//
//  EurekaApp.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/11.
//

import SwiftUI

@main
struct EurekaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RecipeMockAPI()) // mockAPI
                .environmentObject(IngredientMockAPI()) //mockAPI
        }
    }
}
