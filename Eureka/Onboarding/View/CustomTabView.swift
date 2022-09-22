
import SwiftUI

struct CustomTabView: View {
    @EnvironmentObject var tabselector: TabSelector
    
    init(){
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        TabView(selection: $tabselector.selectedTab){
            RecipeMainView()
                .navigationTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image("menu_home")
                    Text("Home".localized())
                }
                .tag(0)
            IngredientMainView()
                .navigationTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image("menu_ingredient")
                    Text("Ingredient".localized())
                }
                .tag(1)
            NotMVPView()
                .navigationTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image("menu_search")
                    Text("Search".localized())
                }
                .tag(2)
//            NotMVPView()
//                .navigationTitle("")
//                .navigationBarHidden(true)
//                .tabItem{
//                    Image("menu_community")
//                    Text("커뮤니티")
//                }
//                .tag(4)
            MypageView()
                .navigationTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image("menu_my")
                    Text("Mypage".localized())
                }
                .tag(3)
        }
        .accentColor(.appGreen)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

