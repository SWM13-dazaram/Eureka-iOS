//
//  RecipeViewModel.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/26.
//

import Foundation
import Moya

class RecipeMockAPI: ObservableObject {
    @Published var replaced = [Recipe]()
    @Published var expire = [Recipe]()
    let provider = MoyaProvider<API>()
    
    init(){
        getReplaced()
        getExpire()
    }
    
    func getReplaced(){
        provider.request(.recommendReplacedRecipe) { response in
            switch response {
            case .success(let result):
                do{
                    print(result.data)
                    let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
                    self.replaced = tmp
                }catch(let err){
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getExpire(){
        provider.request(.recommendAllExpireDateRecipes) { response in
            switch response {
            case .success(let result):
                do{
                    print(result.data)
                    let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
                    self.expire = tmp
                }catch(let err){
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
}
