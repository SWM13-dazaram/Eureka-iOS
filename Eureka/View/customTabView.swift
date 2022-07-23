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
                    Image(systemName: "person")
                    Text("홈")
                }
            Text("만드는중")
                .tabItem{
                    Image(systemName: "person")
                    Text("식재료")
                }
            Text("만드는중")
                .tabItem{
                    Image(systemName: "person")
                    Text("레시피검색")
                }
            Text("만드는중")
                .tabItem{
                    Image(systemName: "person")
                    Text("커뮤니티")
                }
            Text("만드는중")
                .tabItem{
                    Image(systemName: "person")
                    Text("마이페이지")
                }
        }
    }
}

struct customTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}

