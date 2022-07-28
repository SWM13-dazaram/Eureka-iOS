//
//  RecipeViewModel.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/26.
//

import Foundation
import Moya

class MockAPI: ObservableObject {
    @Published var recipe = [Recipe]()
    let provider = MoyaProvider<API>()
    
    init(){
        getRecipe()
    }
    
    func getRecipe(){
        provider.request(.recommendReplacedRecipe) { response in
            switch response {
            case .success(let result):
                do{
                    print(result.data)
                    let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
                    self.recipe = tmp
                }catch(let err){
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
