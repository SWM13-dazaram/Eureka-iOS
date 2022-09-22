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
            Text("Recipe Empty".localized())
                .foregroundColor(.appGray)
            WhiteButton(text: "+"+"Adding Ingredient".localized())
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
