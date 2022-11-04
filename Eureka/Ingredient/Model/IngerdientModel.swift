
import Foundation
import SwiftUI

struct Ingredient: Codable, Identifiable {
    let id: Int
    var name: String
    var icon: String
    
    //TODO: icon optional 고치고 지우기
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case name = "name"
        case icon = "icon"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.icon = (try? container.decode(String.self, forKey: .icon)) ?? ""
    }
}

struct IngredientInfo: Decodable {
    let ingredient: Ingredient
    let expirePeriod: Int?
}

struct UserIngredient: Codable , Identifiable{
    let id: Int
    var name: String
    var insertDate: String
    var expireDate: String
    var memo: String = ""
    var ingredient: Ingredient
//    let nutrientDetail: NutrientInfo?
}

struct CustomIngredient: Codable {
    let category: Category
    let ingredientName: String
    let enrollmentData: String
    let expireData: String
    let memo: String
}

struct CategoryIngredient: Decodable {
    //FIXME: API 수정되면 변경
    let categoryId: String
    let categoryName: String
//    let category: Category
    let ingredients: [Ingredient]
    
}

struct Category: Codable {
    let id: String
    let name: String
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

