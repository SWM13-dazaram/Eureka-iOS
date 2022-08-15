//
//  ContentView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/11.
//

import SwiftUI

struct ContentView: View {
    @State var main = true
    var body: some View {
        ZStack{
            // @TODO: 토큰 검사해서 login or mainview 결정
            Color.bg.edgesIgnoringSafeArea(.all)
            NavigationView {
                
                if main {
                    CustomTabView()
                }
                else{
                    LoginView(main: $main)
                    //                SetProfileView(complete: $main)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
