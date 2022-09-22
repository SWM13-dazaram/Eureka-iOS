//
//  NoneView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/25.
//

import SwiftUI

struct RecipeNoneView: View {
    @EnvironmentObject var tabSeletor: TabSelector
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            Image("empty_main")
            Text("재료가 부족해 추천에 실패했어요 🥺")
                .foregroundColor(.appGray)
            WhiteButton(text: "+ 식재료 추가하기")
                .onTapGesture {
                    tabSeletor.selectedTab = 1
                }
            Spacer()
        }
    }
}

struct NoneView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeNoneView()
    }
}
