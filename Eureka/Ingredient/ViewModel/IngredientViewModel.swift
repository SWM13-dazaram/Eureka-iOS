
import Foundation
import Moya
import SwiftUI

class IngredientVM: ObservableObject {
    let provider = MoyaProvider<IngredientAPI>()
    @Published var userIngredient = [UserIngredient]()
    @Published var dataResponse = Response.loading
    
    func getUserIngredient(){
        provider.request(.findAllUserIngredient) { response in
            switch response {
            case .success(let result):
                do{
                    if result.statusCode == 200 {
                        print("🤖getUserIngredient \(result.description)")
                        let data = try JSONDecoder().decode([UserIngredient].self, from: result.data)
                        self.userIngredient = data
                        self.dataResponse = .success
                    }else{
                        self.dataResponse = .empty
                    }
                }catch(let err){
                    self.dataResponse = .error
                    print("🤖getUserIngredient parse error: \(err.localizedDescription)")
                }
            case .failure(let err):
                self.dataResponse = .error
                print("🤖getUserIngredient failure error: \(err.localizedDescription)")
            }
        }
    }
    
    func deleteUserIngredient(index: Int){
        let data = userIngredient[index].id
        provider.request(.deleteUserIngredient(userIngredientId: data)) { response in
            switch response {
            case .success(let result):
                print("deleteUserIngredient: \(result.description)")
//                self.dataResponse = .loading
                self.userIngredient.remove(at: index)
                CacheManager.removeCustomObject(key: .expireRecipe)
                CacheManager.removeCustomObject(key: .replcedRecipe)
//                self.getUserIngredient()
            case .failure(let err):
                print("getAllIngredient failure error: \(err.localizedDescription)")
            }
        }
    }
    
    func updateUserIngredient(data: UserIngredient){
        provider.request(.updateUserIngredient(data: data)) { response in
            switch response {
            case .success(let result):
                print("updateUserIngredient:  \(result.description)")
            case .failure(let err):
                print("updateUserIngredient failure error: \(err.localizedDescription)")
            }
        }
    }
}
