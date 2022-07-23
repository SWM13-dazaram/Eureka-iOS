//
//  recipe.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/13.
//

import Foundation

struct replacedRecipe: Codable {
    let id: Int
    let name: String
    let image: String
    let isLike: Bool
    let ownIngredientList: [Ingredient]
    let replaceIngredient: ReplaceIngredient
    let recipeSequenceList: [RecipeSequence]
}


struct RecipeSequence: Codable {
    let number: Int
    let Content: String
    let hightlightIndexList: [HightlightIndex]?
    
}

struct HightlightIndex: Codable {
    let start: Int
    let end: Int
}
