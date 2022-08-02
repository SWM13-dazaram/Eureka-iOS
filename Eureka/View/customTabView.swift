//
//  customTabView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/20.
//

import SwiftUI

struct BottomTabView: View {
    @State var select = 0
    
    init(){
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        TabView(selection: $select){
            MainView()
                .tabItem{
                    Image("menu_home")
                    Text("홈")
                }
                .tag(0)
            IngredientView()
                .tabItem{
                    Image("menu_ingredient")
                    Text("식재료")
                }
                .tag(1)
            Text("만드는중")
                .tabItem{
                    Image("menu_search")
                    Text("레시피검색")
                }
                .tag(2)
            Text("만드는중")
                .tabItem{
                    Image("menu_community")
                    Text("커뮤니티")
                }
                .tag(3)
            Text("만드는중")
                .tabItem{
                    Image("menu_my")
                    Text("마이페이지")
                }
                .tag(4)
        }
        .accentColor(.appGreen)
    }
}

struct customTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
            .environmentObject(RecipeMockAPI())
    }
}

