//
//  IngredientData.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/18.
//

import Foundation

class IngredientData: ObservableObject {
    @Published var userIngredients = [UserIngredient]()
    
    func update(data: [UserIngredient]) {
        self.userIngredients = data
    }
}
