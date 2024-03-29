//
//  recipe.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/13.
//

import Foundation

enum RecipeType {
    case replace
    case expire
}

struct Recipe: Decodable {
    let id: Int
//    let url: String
    let title: String
    let image: String
    let isLike: Bool?
    let ingredients: [Ingredient]
    let recipeSequences: [RecipeSequence]
    let replacement: ReplaceIngredient?
    let imminentIngredient: Ingredient?
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
