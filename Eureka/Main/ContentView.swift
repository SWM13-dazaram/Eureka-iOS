//
//  ContentView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/11.
//

import SwiftUI

struct SplashScreen: View {
    @State var splash = true
    @ObservedObject var networkManager = NetworkManager()
    @State var alertToggle = true
    
    var body: some View {
        Group{
            if splash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                            splash=false
                        }
                    }
            }
            else{
                Group{
                    if networkManager.isConnected {
                        ContentView()
                    }
                    else {
                        SplashView()
                            .alert("네트워크 상태", isPresented: $alertToggle) {
                                Button("확인") {
                                    alertToggle.toggle()
                                    exit(0)
                                }
                            } message: {
                                Text("네트워크 연결이 불안정 합니다 :(")
                            }
                    }
                }
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
