//
//  ExpireRecipeViewModel.swift
//  Eureka
//
//  Created by 김민령 on 2022/10/06.
//

import Foundation
import Moya

class ExpireRecipeVM: RecipeViewModelProtocol {
    let provider = MoyaProvider<MainRecipeAPI>()
    @Published var recipe : [Recipe]?
    @Published var recipeNetwork = Response.loading
    
    init(){
        print("Expire Recipe VM init()")
    }
    
    func getRecipe(){
        if let cached = CacheManager.shared.object(forKey: "expire"){
            recipeNetwork = .success
            self.recipe = (cached as! [Recipe])
            return
        }
        provider.request(.recommendAllExpireDateRecipes) { response in
            switch response {
            case .success(let result):
                do{
                    print("🤖 get expire recipe \(result.description)")
                    if result.statusCode == 200 {
                        let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
                        self.recipe = tmp
                        self.recipeNetwork = .success
                        CacheManager.shared.setObject(tmp as AnyObject, forKey: "expire")
                    }
                    else{
                        self.recipeNetwork = .empty
                    }
                }catch(let err){
                    self.recipeNetwork = .error
                    print("‼️ get expire recipe parse error : \(err.localizedDescription)")
                }
            case .failure(let err):
                self.recipeNetwork = .error
                print("‼️ get expire recipe failure error : \(err.localizedDescription)")
            }
        }
    }
    
}
