//
//  ReplaceRecipeViewModel.swift
//  Eureka
//
//  Created by 김민령 on 2022/10/06.
//

import Foundation
import Moya

class ReplaceRecipeVM: RecipeViewModelProtocol {
    
    let provider = MoyaProvider<MainRecipeAPI>()
    @Published var recipe : [Recipe]?
    @Published var recipeNetwork = Response.loading
    
    init(){
        print("Replace Recipe VM init()")
    }
    
    func getRecipe(){
        if let cached = CacheManager.shared.object(forKey: "replaced"){
            recipeNetwork = .success
            self.recipe = (cached as! [Recipe])
            return
        }
        provider.request(.recommendAllReplacedRecipes) { response in
            switch response {
            case .success(let result):
                do{
                    print("🤖 get replaced recipe \(result.description)")
                    if result.statusCode == 200 {
                        let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
                        self.recipe = tmp
                        self.recipeNetwork = .success
                        CacheManager.shared.setObject(tmp as AnyObject, forKey: "replaced")
                    }
                    else {
                        self.recipeNetwork = .empty
                    }
                }catch(let err){
                    self.recipeNetwork = .error
                    print("‼️ get replaced recipe parse error : \(err.localizedDescription)")
                }
            case .failure(let err):
                self.recipeNetwork = .error
                print("‼️ get replaced recipe failure error : \(err.localizedDescription)")
            }
        }
    }
    
}
