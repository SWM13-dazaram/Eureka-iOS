
import Foundation
import SwiftUI

struct Ingredient: Decodable, Identifiable {
    let id: Int
    let name: String
    let icon: String
}

struct UserIngredient: Decodable {
//    let id: Int
    let id: String // mockAPI
    let insertDate: String
    let expireDate: String
    let memo: String
    let ingredient: Ingredient
//    let nutrientDetail: NutrientInfo?
}

struct CustomIngredient: Codable {
    let category: String?
    let ingredientName: String
    let enrollmentData: String
    let expireData: String
    let memo: String
}

struct CategoryIngredient: Decodable {
//    let id: Int
    let categoryId: String //mockAPI
    let categoryName: String
    let ingredients: [Ingredient]
    
}


//어떤 항목을 어떻게 표시할건지 아직 미정상태
struct NutrientInfo: Codable {
    let a: Int
    let b: Int
}


struct ReplaceIngredient: Decodable {
    let missingIngredient: Ingredient
    let ownIngredient: Ingredient
    let similarity: Float
}

