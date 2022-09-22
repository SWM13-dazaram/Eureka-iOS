//
//  ContentView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/11.
//

import SwiftUI


struct ContentView: View {
//    @EnvironmentObject var mainRecipeVM : MainRecipeVM
    @EnvironmentObject var loginVM : LoginViewModel
    
    var body: some View {
        ZStack{
            Color.bg.edgesIgnoringSafeArea(.all)
            NavigationView {
                if loginVM.status {
                    ZStack{
                        CustomTabView()
//                            .onAppear {
//                                mainRecipeVM.getReplaced()
//                                mainRecipeVM.getExpire()
//                            }
                    }
                }
                else{
                    LoginView()
                }
            }
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewInterfaceOrientation(.portrait)
//            .environmentObject(MainRecipeVM())
//            .environmentObject(IngredientVM())
//    }
//}
