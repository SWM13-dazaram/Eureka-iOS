//
//  IngredientButton.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/03.
//

import SwiftUI

struct IngredientButton: View {
    @EnvironmentObject var addVM: AddIngredient
    let ingredient: Ingredient
    var icon: IngredientIcon

    init(_ ingredient : Ingredient){
        self.ingredient = ingredient
        self.icon = IngredientIcon(ingredient.icon, size: 64)
    }

    var body: some View {
        Button {
            addVM.toggleIngredient(ingredient)
        } label: {
            VStack{
                ZStack{
                    icon
                    Circle()
                        .stroke(addVM.toggleStatus(ingredient) ? Color.appGreen : Color.barBackground, lineWidth: addVM.toggleStatus(ingredient) ? 2 : 0)
                    if addVM.toggleStatus(ingredient){
                        Image("check")
                            .offset(x: 21, y: -21)
                    }
                }
                Text(ingredient.name)
                    .lineLimit(1)
                    .font(.system(size: 11))
                    .foregroundColor(.appGray)
            }
        }
    }
}
