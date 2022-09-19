//
//  MainView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/20.
//

import SwiftUI


struct MainView: View {
    @State var selectedIndex = true
    var tmp = DateCalculater()
//    @State var loading = true
    
    var body: some View {
        ZStack{
            Color.bg
                .ignoresSafeArea()
            GeometryReader { proxy in
                VStack{
                    MainTitle("오늘의 레시피를 확인해보세요 😋", width: 160, height: 69)
                    TitleTabView($selectedIndex)
                    switch selectedIndex {
                    case true:
                        ReplaceView(proxy: proxy)
//                        ReplaceView()
                    case false:
                        ExpireDateView(proxy: proxy)
//                        ExpireDateView()
                    }
                }
            }
            .padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
        }
    }
}

struct TitleTabView: View{
    @Binding var selectedIndex: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    selectedIndex = true
                } label: {
                    Text("🥑 식재료 대체")
                        .font(.system(size: 12))
                        .frame(width: 155, height: 34, alignment: .center)
                        .background(selectedIndex == true ? Color.appGreen : .white)
                        .foregroundColor(selectedIndex == true ? .white : .appGray)
                        .cornerRadius(20)
                        
                }
                Button {
                    selectedIndex = false
                } label: {
                    Text("🧨 유통기한")
                        .font(.system(size: 12))
                        .frame(width: 155, height: 34, alignment: .center)
                        .background(selectedIndex == false ? Color.appGreen : .white)
                        .foregroundColor(selectedIndex == false ? .white : .appGray)
                        .cornerRadius(20)
                }
            }
        }
    }
    
    init(_ selectedIndex: Binding<Bool>){
        self._selectedIndex = selectedIndex
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainRecipeVM())
            .environmentObject(IngredientVM())
    }
}
