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
    }
    var body: some View{
        ForEach(recipe.ownIngredientList, id: \.self.id){ idx in
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
    let ingredientInfo: Ingredient
    let status: IngredientStatus?
    
    init(_ ingredientInfo: Ingredient, _ status: Status? = nil){
        self.ingredientInfo = ingredientInfo
        if let statusCode = status{
            self.status = IngredientStatus(ingredientInfo.name, statusCode)
        }
        else{
            self.status = nil
        }
    }
    
    var body: some View {
        HStack{
            IngredientIcon(ingredientInfo.icon)
            Text(ingredientInfo.name)
                .font(.system(size: 13))
                .foregroundColor(.appBlack)
            Text("3개")
                .font(.system(size: 13))
                .foregroundColor(.appBlack)
            Spacer()
            status
        }
        .padding(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
    }
}

struct IngredientStatus: View{
    let textColor: Color
    let bgColor: Color
    let text: String
    
    init(_ ingredient: String, _ color: Status){
        switch color {
        case .replaced:
            self.textColor = .appGreen
            self.bgColor = .bgGreen
            self.text = "\(ingredient) 대체재료"
        case .expire:
            self.textColor = .appRed
            self.bgColor = .bgRed
            self.text = "유통기한 임박재료"
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
