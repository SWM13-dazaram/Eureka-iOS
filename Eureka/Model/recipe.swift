//
//  recipe.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/13.
//

import Foundation

struct replacedRecipe: Codable {
    let recipeId: Int
    let recipeName: String
    let recipeImage: String
    let isLike: Bool
    let ownIngredientList: [Ingredient]
    let replaceIngredient: ReplaceIngredient
    let recipeSequenceList: [RecipeSequence]
}

struct ReplaceIngredient: Codable {
    let missingIngredient: Ingredient
    let ownIngredient: Ingredient
    let Similarity: Int
}

struct RecipeSequence: Codable {
    let recipeSequenceNumber: Int
    let recipeSequenceContent: String
    let hightlightIndexList: [HightlightIndex]
    
}

struct HightlightIndex: Codable {
    let hightlightIndextStart: Int
    let hightlightIndexEnd: Int
}
