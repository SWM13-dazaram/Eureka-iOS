//
//  IngredientButton.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/03.
//

import SwiftUI

// @TODO: 에러잡기 EnvironmentObject or StateObject
struct IngredientButton: View {
    let ingredient: Ingredient
    var icon: IngredientIcon

    init(_ ingredient : Ingredient){
        self.ingredient = ingredient
        self.icon = IngredientIcon(ingredient.icon, size: 64)
    }

    var body: some View {
//        Button {
//            mockVM.toggleIngredient(ingredient: ingredient)
//        } label: {
//            VStack{
//                ZStack{
//                    icon
//                    Circle()
//                        .stroke(mockVM.toggleStatus(id: ingredient.id) ? Color.appGreen : Color.barBackground, lineWidth: mockVM.toggleStatus(id: ingredient.id) ? 2 : 0)
//                    if addVM.toggleStatus(id: ingredient.id){
//                        Image("check")
//                            .offset(x: 21, y: -21)
//                    }
//                }
//                Text(ingredient.name)
//                    .font(.system(size: 11))
//                    .foregroundColor(.appGray)
//            }
//
//        }
Text("test")
    }
}
