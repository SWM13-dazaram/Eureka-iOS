//
//  ContentView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/11.
//

import SwiftUI

struct SplashScreen: View {
    @State var splash = true
    var body: some View {
        ZStack{
            ContentView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                        splash=false
                    }
                }
            if splash {
                SplashView()
            }
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var mainRecipeVM : MainRecipeVM
    @EnvironmentObject var oauth: Oauth
    
    var body: some View {
        ZStack{
            Color.bg.edgesIgnoringSafeArea(.all)
            NavigationView {
                if oauth.status {
                    ZStack{
                        CustomTabView()
                            .onAppear {
                                mainRecipeVM.getReplaced()
                                mainRecipeVM.getExpire()
                            }
                    }
                }
                else{
                    LoginView()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
            .environmentObject(MainRecipeVM())
            .environmentObject(IngredientVM())
    }
}
