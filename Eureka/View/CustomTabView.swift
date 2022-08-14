
import SwiftUI

struct CustomTabView: View {
    @State var select = 0
    
    init(){
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .white
    }
    // TODO: navigation bar bug fix
    var body: some View {
        TabView(selection: $select){
            MainView()
                .navigationTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image("menu_home")
                    Text("홈")
                }
                .tag(0)
            IngredientView()
                .navigationTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image("menu_ingredient")
                    Text("식재료")
                }
                .tag(1)
            NotMVPView()
                .navigationTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image("menu_search")
                    Text("레시피검색")
                }
                .tag(2)
            NotMVPView()
                .navigationTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image("menu_community")
                    Text("커뮤니티")
                }
                .tag(3)
            NotMVPView()
                .navigationTitle("")
                .navigationBarHidden(true)
                .tabItem{
                    Image("menu_my")
                    Text("마이페이지")
                }
                .tag(4)
        }
        .accentColor(.appGreen)

    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
            .environmentObject(MockVM())
    }
}

