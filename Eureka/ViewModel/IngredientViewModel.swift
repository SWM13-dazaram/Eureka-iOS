
import Foundation
import Moya
import SwiftUI

class IngredientVM: ObservableObject {
    let provider = MoyaProvider<IngredientAPI>()
    @Published var userIngredient = [UserIngredient]()
    @Published var allIngredient = [CategoryIngredient]() {
        willSet{
            print("allIngredient change count : \(newValue.count)")
        }
    }
    
    func getUserIngredient(){
        provider.request(.findAllUserIngredient) { response in
            switch response {
            case .success(let result):
                do{
                    print(result.data)
                    let data = try JSONDecoder().decode([UserIngredient].self, from: result.data)
                    self.userIngredient = data
                }catch(let err){
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }

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
        provider.request(.updateUserIngredient(UserIngredient: data)) { response in
            switch response {
            case .success(let result):
                print("updateUserIngredient:  \(result.description)")
            case .failure(let err):
                print("updateUserIngredient failure error: \(err.localizedDescription)")
            }
        }
    }
}
