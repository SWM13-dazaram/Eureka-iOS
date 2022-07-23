//
//  MainView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/20.
//

import SwiftUI

struct MainView: View {
    @State var selectedIndex = true
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 30){
                Spacer()
                MainTitle("오늘의 레시피를 확인해보세요😋")
                TitleTabView($selectedIndex)
                switch selectedIndex {
                case true:
                    ReplaceView()
                case false:
                    ExpireDateView()
                }
            }
        }
    }
}

struct MainTitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 30, weight: .bold))
            .frame(width: 300, alignment: .leading)
    }
    
    init(_ text: String) {
        self.text = text
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
                    Text("🥑 식재료대체")
                        .frame(width: 160, height: 40, alignment: .center)
                        .background(selectedIndex == true ? .green : .white)
                        .foregroundColor(selectedIndex == true ? .white : .gray)
                        .cornerRadius(100)
                        
                }
                Button {
                    selectedIndex = false
                } label: {
                    Text("🧨 유통기한")
                        .frame(width: 160, height: 40, alignment: .center)
                        .background(selectedIndex == false ? .green : .white)
                        .foregroundColor(selectedIndex == false ? .white : .gray)
                        .cornerRadius(100)
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
    }
}
