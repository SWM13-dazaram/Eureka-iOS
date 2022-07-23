
import Foundation
import SwiftUI

struct Ingredient: Codable {
    let id: Int
    let name: String
    let icon: String
}

struct UserIngredient: Codable {
    let id: Int?
    let insertData: String
    let expireData: String
    let memo: String
    let ingredient: Ingredient
    let nutrientDetail: NutrientInfo?
}

struct CustomIngredient: Codable {
    let category: String?
    let ingredientName: String
    let enrollmentData: String
    let expireData: String
    let memo: String
}


//어떤 항목을 어떻게 표시할건지 아직 미정상태
struct NutrientInfo: Codable {
    let a: Int
    let b: Int
}


struct ReplaceIngredient: Codable {
    let missingIngredient: Ingredient
    let ownIngredient: Ingredient
    let Similarity: Int
}

