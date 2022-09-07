//
//  recipe.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/13.
//

import Foundation

struct Recipe: Decodable {
    let id: Int
//    let url: String
    let title: String
    let image: String
    let isLike: Bool
    let ingredients: [Ingredient]
    let recipeSequences: [RecipeSequence]
    let replaceIngredient: ReplaceIngredient?
    let expireIngredient: Ingredient?
}

struct RecipeSequence: Decodable {
    let sequence: Int
    let content: String
    let hightlightIndexList: [HightlightIndex]?
    
}

struct HightlightIndex: Decodable {
    let start: Int
    let end: Int
}
