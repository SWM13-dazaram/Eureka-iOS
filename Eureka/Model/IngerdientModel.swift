//
//  IngerdientModel.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/13.
//

import Foundation
import SwiftUI

struct Ingredient: Codable {
    let ingerdientId: Int
    let ingredientName: String
    let ingredientIcon: String
}

//어떤 항목을 어떻게 표시할건지 아직 미정상태
struct nutrientInfo: Codable {
    let A: Int
    let B: Int
}

struct userIngredient: Codable {
    let userIngredientId: Int
    let userIngredientInsertData: String
    let userIngredientExpireData: String
    let memo: String
    let ingredient: Ingredient
    let nutrientDetail: nutrientInfo
}

struct customIngredient: Codable {
    let category: String?
    let ingredientName: String
    let enrollmentData: String
    let expireData: String
    let memo: String
}
