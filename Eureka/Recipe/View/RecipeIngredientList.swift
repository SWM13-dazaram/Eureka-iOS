//
//  RecipeIngredientCell.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/01.
//

import SwiftUI


struct RecipeIngredientList: View{
    let recipe: Recipe
    
    init(_ recipe: Recipe){
        self.recipe = recipe
//        print("expireRecipe Ingredient List : \(recipe)")
    }
    var body: some View{
        ForEach(recipe.ingredients, id: \.self.id){ idx in
            if let replaced = recipe.replaceIngredient {
                if replaced.ownIngredient.id == idx.id {
                    RecipeIngredientCell(replaced.missingIngredient, Status.replaced)
                }
                else{
                    RecipeIngredientCell(idx)
                }
            }
            if let expire = recipe.expireIngredient {
                if expire.id == idx.id {
                    RecipeIngredientCell(idx, Status.expire)
                }
                else{
                    RecipeIngredientCell(idx)
                }
            }
        }
    }
}


struct RecipeIngredientCell: View {
    let ingredientName: String
    let ingredientIcon: IngredientIcon
    let status: IngredientStatus?
    
    init(_ ingredientInfo: Ingredient, _ status: Status? = nil){
        self.ingredientName = ingredientInfo.name
        if let statusCode = status{
            self.ingredientIcon = IngredientIcon(ingredientInfo.icon, status: statusCode)
            self.status = IngredientStatus(ingredientInfo.name, statusCode)
        }
        else{
            self.ingredientIcon = IngredientIcon(ingredientInfo.icon)
            self.status = nil
        }
    }
    
    var body: some View {
        HStack{
            ingredientIcon
            Text(ingredientName)
                .font(.system(size: 13))
                .foregroundColor(.appBlack)
            Text("%d Amount".localized(with: 3))
                .font(.system(size: 13))
                .foregroundColor(.appBlack)
            Spacer()
            status
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 1)
    }
}

struct IngredientStatus: View{
    let textColor: Color
    let bgColor: Color
    var text: String
    
    init(_ ingredient: String, _ color: Status){
        switch color {
        case .replaced:
            self.textColor = .appGreen
            self.bgColor = .bgGreen
            self.text = "%@ Replace Ingredient".localized(with: "\(ingredient)")
        case .expire:
            self.textColor = .appRed
            self.bgColor = .bgRed
            self.text = ""
            self.text = "Expire Ingredient".localized()
        }
    }
    
    var body: some View{
        Text(text)
            .font(.system(size: 10))
            .foregroundColor(textColor)
            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(bgColor)
            .cornerRadius(15)
    }

}
