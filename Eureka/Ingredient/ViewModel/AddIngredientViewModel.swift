//
//  AddIngredient.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/04.
//

import Foundation
import Moya

class AddIngredientViewModel: ObservableObject {
    let provider = MoyaProvider<IngredientAPI>()
    @Published var selected = [Int : Bool]()
    @Published var userIngredient = [UserIngredient]()
    @Published var allIngredient = [CategoryIngredient]() {
        willSet{
            print("allIngredient change count : \(newValue.count)")
        }
    }
    
    init(){
        print("AddIngredient init()")
    }
    
    
    func getAllIngredient(){
        provider.request(.findAllIngredient(categoryId: "")) { response in
            switch response {
            case .success(let result):
                do{
                    print("getAllIngredient \(result.description)")
                    print(result.data)
                    let data = try JSONDecoder().decode([CategoryIngredient].self, from: result.data)
                    self.allIngredient = data
                }catch(let err){
                    print("getAllIngredient error: \(err.localizedDescription)")
                }
            case .failure(let err):
                print("getAllIngredient failure error: \(err.localizedDescription)")
            }
        }
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
        let result = SelectedIngredientId()
        return result.count
    }
    
    func SelectedIngredientId() -> [Int] {
        let result = selected.filter({(k:Int, v:Bool) -> Bool in return v == true })
        return Array(result.keys)
    }
    
    func getDefaultIngredientInfo(){
        
        userIngredient = []
        let ingredientId = SelectedIngredientId()
        print("selected ingredient ID : \(ingredientId)")
        provider.request(.getSelectedIngredientInfo(data: ingredientId)) { response in
            switch response {
            case .success(let result):
                do{
                    print("getSelectedIngredientInfo success : \(result)")
                    let data = try JSONDecoder().decode([IngredientInfo].self, from: result.data)
                    print("getSelectedIngredientInfo parsing : \(data)")
                    let todayString = DateCalculater.changeDateToStr(date: Date())
                    var expireString = DateCalculater.changeDateToStr(date: Date())
                    for info in data {
                        if info.expirePeriod != nil {
                            let tmp = DateCalculater.calExpireDate(days: info.expirePeriod!)
                            expireString = DateCalculater.changeDateToStr(date: tmp)
                        }
                        let ingredientInfo = UserIngredient(id: -1, name: info.ingredient.name, insertDate: todayString, expireDate: expireString, ingredient: info.ingredient)
                        self.userIngredient.append(ingredientInfo)
                    }
                }catch(let err){
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    
    func setIngredientData(){
//    func setIngredientData() -> Bool{
//        var returnValue = true
        
        provider.request(.setSelectedIngredient(data: userIngredient)) {
            response in
            switch response {
            case .success(let result):
                do{
                    print("setSelectedIngredient success : \(result)")
                    let data = try JSONDecoder().decode([Int].self, from: result.data)
                    print("setSelectedIngredient response : \(data)")
                    CacheManager.removeCustomObject(key: .expireRecipe)
                    CacheManager.removeCustomObject(key: .replcedRecipe)
                }catch(let err){
//                    returnValue = false
                    print(err.localizedDescription)
                }
            case .failure(let err):
//                returnValue = false
                print(err.localizedDescription)
            }
        }
//        return returnValue
    }
    
    func resetTmpData(){
        selected = [:]
        userIngredient = []
    }
}
