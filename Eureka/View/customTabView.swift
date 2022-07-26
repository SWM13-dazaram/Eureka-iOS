//
//  customTabView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/20.
//

import SwiftUI

struct BottomTabView: View {
    var body: some View {
        TabView{
            MainView()
                .tabItem{
                    Image("menu_home")
                    Text("홈")
                }
            Text("만드는중")
                .tabItem{
                    Image("menu_ingredient")
                    Text("식재료")
                }
            Text("만드는중")
                .tabItem{
                    Image("menu_search")
                    Text("레시피검색")
                }
            Text("만드는중")
                .tabItem{
                    Image("menu_community")
                    Text("커뮤니티")
                }
            Text("만드는중")
                .tabItem{
                    Image("menu_my")
                    Text("마이페이지")
                }
        }
        .accentColor(.appGreen)
    }
}

struct customTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}

