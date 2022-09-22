//
//  MainView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/20.
//

import SwiftUI


struct RecipeMainView: View {
    @State var recipeType = RecipeType.replace
    @EnvironmentObject var recipeVM : MainRecipeVM
//    @State var loading = true
    
    var body: some View {
        ZStack{
            Color.bg
                .ignoresSafeArea()
            GeometryReader { proxy in
                VStack{
                    MainTitle("오늘의 레시피를 확인해보세요 😋", width: 160, height: 69)
                    TitleTabView($recipeType)
                    switch recipeType {
                    case .replace:
                        ReplaceView(proxy: proxy)
                            .onAppear{
                                recipeVM.getReplaced()
                            }
                    case .expire:
                        ExpireDateView(proxy: proxy)
                            .onAppear{
                                recipeVM.getExpire()
                            }
                    }
                }
            }
            .padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
        }
    }
}

struct TitleTabView: View{
    @Binding var recipeType: RecipeType
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    recipeType = .replace
                } label: {
                    Text("🥑 식재료 대체")
                        .font(.system(size: 12))
                        .frame(width: 155, height: 34, alignment: .center)
                        .background(recipeType == .replace ? Color.appGreen : .white)
                        .foregroundColor(recipeType == .replace ? .white : .appGray)
                        .cornerRadius(20)
                        
                }
                Button {
                    recipeType = .expire
                } label: {
                    Text("🧨 유통기한")
                        .font(.system(size: 12))
                        .frame(width: 155, height: 34, alignment: .center)
                        .background(recipeType == .expire ? Color.appGreen : .white)
                        .foregroundColor(recipeType == .expire ? .white : .appGray)
                        .cornerRadius(20)
                }
            }
        }
    }
    
    init(_ recipeType: Binding<RecipeType>){
        self._recipeType = recipeType
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeMainView()
//            .environmentObject(MainRecipeVM())
//            .environmentObject(IngredientVM())
//    }
//}
