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
    
    func getDefaultIngredientInfo(){
        let dateCal = DateCalculater()
        
//        let ingredientInfoList = [IngredientInfo]()
//        provider.request(.getSelectedIngredient) { response in
//            switch response {
//            case .success(let result):
//                do{
//                    print(result.data)
//                    let tmp = try JSONDecoder().decode([IngredientInfo].self, from: result.data)
//                    defaultIngredientInfo = tmp
//                }catch(let err){
//                    print(err.localizedDescription)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//        for info in ingredientInfoList {
//            let ingredientInfo = UserIngredient(id: nil, insertDate: 오늘, expireDate: info.expirePeriod, memo: nil, ingredient: info.ingredient)
//            self.userIngredient.append(contentsOf: ingredientInfo)
//        }
        
        //더미데이터 임시 생성
        var dummyList = [IngredientInfo]()
        dummyList.append(IngredientInfo(ingredient: Ingredient(id: 1, name: "고구마", icon :"mushroom"), expirePeriod: 22))
        dummyList.append(IngredientInfo(ingredient: Ingredient(id: 2, name: "새송이버섯", icon :"mushroom"), expirePeriod: 14))
        
        for dummy in dummyList {
            let ingredientInfo = UserIngredient(id: nil, insertDate: dateCal.changeDateToStr(date: Date()), expireDate: dateCal.calExpireDate(days: dummy.expirePeriod), memo: "", ingredient: dummy.ingredient)
            self.userIngredient.append(ingredientInfo)
        }
        print("userIngredient : \(userIngredient)")
        
    }
    
}
