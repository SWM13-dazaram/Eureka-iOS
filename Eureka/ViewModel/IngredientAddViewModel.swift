//
//  IngredientAddViewModel.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/03.
//

import Foundation
import Moya

class IngredientAddVM : ObservableObject {
    let provider = MoyaProvider<API>()
    @Published var allIngredient = [CategoryIngredient]()
    @Published var selectedIngredient = [Int : Bool]()
    
    init(){
        connect()
        for idx in allIngredient{
            for item in idx.ingredients{
                selectedIngredient[item.id] = false
            }
        }
        
    }
    
    func connect(){
        provider.request(.findAllIngredientsByCategory) { response in
            switch response {
            case .success(let result):
                do{
                    print(result.data)
                    let tmp = try JSONDecoder().decode([CategoryIngredient].self, from: result.data)
                    print(tmp)
                    self.allIngredient = tmp
                }catch(let err){
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func toggleIngredient(ingredient: Ingredient) {
        selectedIngredient[ingredient.id]?.toggle()
    }
    
    func toggleStatus(id: Int) -> Bool{
        if let selected = selectedIngredient[id]{
            return selected
        }
        return false
    }
    
    func isClick() -> Bool {
        for (_,v) in selectedIngredient{
            if v == true{
                return true
            }
        }
        return false
    }
    
}
