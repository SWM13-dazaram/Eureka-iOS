//
//  CustomIngredient.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/17.
//

import Foundation
import Moya

class CustomUserIngredientViewModel: ObservableObject {
    let provider = MoyaProvider<IngredientAPI>()
    @Published var categories = [Category]()
    @Published var representaion = [Ingredient]()
    
    init(){
        getCategories()
        getRepresentationIngredient()
    }
    
    func setCustomIngredient(data: UserIngredient){
        provider.request(.createCustomIngredient(data: data)) { response in
            switch response {
            case .success(let result):
                print("createCustomIngredient: \(result.description)")
                CacheManager.removeCustomObject(key: .expireRecipe)
                CacheManager.removeCustomObject(key: .replcedRecipe)
            case .failure(let err):
                print("createCustomIngredient failure error: \(err.localizedDescription)")
            }
        }
    }
    
    func getCategories(){
        provider.request(.getIngredientCategories) { response in
            switch response {
            case .success(let result):
                do{
                    print("getCategories: \(result.description)")
                    let data = try JSONDecoder().decode([Category].self, from: result.data)
                    self.categories = data
                }catch(let err){
                    print("getCategories decode error: \(err.localizedDescription)")
                }
            case .failure(let err):
                print("getCategories failure error: \(err.localizedDescription)")
            }
        }
    }
    
    func getRepresentationIngredient(){
        provider.request(.getRepresentationIngredient) { response in
            switch response {
            case .success(let result):
                do{
                    print("getRepresentationIngredient: \(result.description)")
                    let data = try JSONDecoder().decode([Ingredient].self, from: result.data)
                    self.representaion = data
                }catch(let err){
                    print("getRepresentationIngredient decode error: \(err.localizedDescription)")
                }
            case .failure(let err):
                print("getRepresentationIngredient failure error: \(err.localizedDescription)")
            }
        }
    }
}
