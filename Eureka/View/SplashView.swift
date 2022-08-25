//
//  SplashView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Color.bg
            VStack{
                Spacer()
                Image("MainIcon")
                Spacer()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
