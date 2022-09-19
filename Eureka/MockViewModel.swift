//
//import Foundation
//import Moya
//
//class MockVM: ObservableObject {
//    let provider = MoyaProvider<API>()
//    @Published var userIngredient = [UserIngredient]()
//    @Published var allIngredient = [CategoryIngredient]()
//    @Published var replaced = [Recipe]()
//    @Published var expire = [Recipe]()
//
//    init(){
//        print("MockVM init()")
//    }
//
//    func getReplaced(){
//        provider.request(.recommendReplacedRecipe) { response in
//            switch response {
//            case .success(let result):
//                do{
//                    print(result.data)
//                    let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
//                    self.replaced = tmp
//                }catch(let err){
//                    print(err.localizedDescription)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//    }
//
//    func getExpire(){
//        provider.request(.recommendAllExpireDateRecipes) { response in
//            switch response {
//            case .success(let result):
//                do{
//                    print(result.data)
//                    let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
//                    self.expire = tmp
//                }catch(let err){
//                    print(err.localizedDescription)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//    }
//
//    func getUserIngredient(){
//        provider.request(.findAllUserIngredient) { response in
//            switch response {
//            case .success(let result):
//                do{
//                    print(result.data)
//                    let tmp = try JSONDecoder().decode([UserIngredient].self, from: result.data)
//                    self.userIngredient = tmp
//                }catch(let err){
//                    print(err.localizedDescription)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//
//    }
//
//    func getAllIngredient(){
//        provider.request(.findAllIngredientsByCategory) { response in
//            switch response {
//            case .success(let result):
//                do{
//                    print(result.data)
//                    let tmp = try JSONDecoder().decode([CategoryIngredient].self, from: result.data)
//                    print(tmp)
//                    self.allIngredient = tmp
//                }catch(let err){
//                    print(err.localizedDescription)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//    }
//}
