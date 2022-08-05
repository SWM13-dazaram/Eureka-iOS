//
//  AddIngredient.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/04.
//

import Foundation
import Moya

class AddIngredient: ObservableObject {
    @Published var selected = [Int : Bool]()
    var ingredientsInfo = [UserIngredient]()
    let provider = MoyaProvider<API>()
    
    init(){
        print("@StateObject init()")
    }
    
    func toggleIngredient(_ ingredient: Ingredient){
        if selected[ingredient.id] == nil {
            selected[ingredient.id] = true
        }
        else{
            selected[ingredient.id]!.toggle()
        }
        print(selected)
    }
    
    func toggleStatus(_ ingredient: Ingredient) -> Bool{
        if selected[ingredient.id] == nil{
            return false
        }
        else{
            return selected[ingredient.id]!
        }
    }
    
    func countSelected() -> Int {
        let result = selected.filter({(k:Int, v:Bool) -> Bool in return v == true })
        return result.count
    }
    
//    func defaultInfo() -> Ingredient {
//        
//    }
}
