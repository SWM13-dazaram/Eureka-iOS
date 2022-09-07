
import Foundation
import Moya
import SwiftUI

class IngredientVM: ObservableObject {
    let provider = MoyaProvider<IngredientAPI>()
    @Published var userIngredient = [UserIngredient]()
    
    func getUserIngredient(){
        provider.request(.findAllUserIngredient) { response in
            switch response {
            case .success(let result):
                do{
                    print("🤖getUserIngredient \(result.description)")
                    let data = try JSONDecoder().decode([UserIngredient].self, from: result.data)
                    self.userIngredient = data
                }catch(let err){
                    print("🤖getUserIngredient parse error: \(err.localizedDescription)")
                }
            case .failure(let err):
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
