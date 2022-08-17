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
    @Published var userIngredient = [UserIngredient]()
    let provider = MoyaProvider<IngredientAPI>()
    
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
                    let dateCal = DateCalculater()
                    let todayString = dateCal.changeDateToStr(date: Date())
                    var expireString = dateCal.changeDateToStr(date: Date())
                    for info in data {
                        if info.expirePeriod != nil {
                            let tmp = dateCal.calExpireDate(days: info.expirePeriod!)
                            expireString = dateCal.changeDateToStr(date: tmp)
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
    
    func setIngredientData() -> Bool{
        var returnValue = true
        
        provider.request(.setSelectedIngredient(data: userIngredient)) {
            response in
            switch response {
            case .success(let result):
                do{
                    print("setSelectedIngredient success : \(result)")
                    let data = try JSONDecoder().decode([Int].self, from: result.data)
                    print("setSelectedIngredient response : \(data)")
                }catch(let err){
                    returnValue = false
                    print(err.localizedDescription)
                }
            case .failure(let err):
                returnValue = false
                print(err.localizedDescription)
            }
        }
        selected = [:]
        userIngredient = []
        return returnValue
    }
}
