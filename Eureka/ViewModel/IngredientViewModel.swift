
import Foundation
import Moya

class IngredientMockAPI: ObservableObject {
    @Published var userIngredient = [UserIngredient]()
    let provider = MoyaProvider<API>()
    
    init(){
        getData()
    }
    
    func getData(){
        provider.request(.findAllUserIngredient) { response in
            switch response {
            case .success(let result):
                do{
                    print(result.data)
                    let tmp = try JSONDecoder().decode([UserIngredient].self, from: result.data)
                    self.userIngredient = tmp
                }catch(let err){
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
