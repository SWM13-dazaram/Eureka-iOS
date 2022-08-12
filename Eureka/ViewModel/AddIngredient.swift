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
//    var dummyList = [IngredientInfo]()
    
    init(){
//        //더미데이터 임시 생성
//        dummyList.append(IngredientInfo(ingredient: Ingredient(id: 1, name: "고구마", icon :"mushroom"), expirePeriod: 22))
//        dummyList.append(IngredientInfo(ingredient: Ingredient(id: 2, name: "새송이버섯", icon :"mushroom"), expirePeriod: 14))
//        let dateCal = DateCalculater()
//        for dummy in dummyList {
//            let ingredientInfo = UserIngredient(id: nil, name: dummy.ingredient.name, insertDate: dateCal.changeDateToStr(date: Date()), expireDate: dateCal.calExpireDate(days: dummy.expirePeriod), memo: "", ingredient: dummy.ingredient)
//            self.userIngredient.append(ingredientInfo)
//        }
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

        let ingredientId = SelectedIngredientId()
        print("selected ingredient ID : \(ingredientId)")
        provider.request(.getSelectedIngredientInfo(data: ingredientId)) { response in
            switch response {
            case .success(let result):
                do{
                    let data = try JSONDecoder().decode([IngredientInfo].self, from: result.data)
                    let dateCal = DateCalculater()
                    let todayString = dateCal.changeDateToStr(date: Date())
                    let tmpExpireDate = "2022/09/05"
                    for info in data {
                        let ingredientInfo = UserIngredient(id: -1, name: "", insertDate: todayString, expireDate: tmpExpireDate, ingredient: info.ingredient)
                        self.userIngredient.append(ingredientInfo)
                    }
                }catch(let err){
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        

        print("userIngredient : \(userIngredient)")
        
    }
    
}
