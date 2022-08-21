
import Foundation
import Moya

class MainRecipeVM: ObservableObject {
    let provider = MoyaProvider<MainRecipeAPI>()
    @Published var replaced = [Recipe]()
    @Published var expire = [Recipe]()
    
    init(){
        print("MainRecipeVM init()")
    }
    
    func getReplaced(){
        provider.request(.recommendAllReplacedRecipes) { response in
            switch response {
            case .success(let result):
                do{
                    print("get replaced recipe \(result.description)")
                    let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
                    self.replaced = tmp
                }catch(let err){
                    print("get replaced recipe parse error : \(err.localizedDescription)")
                }
            case .failure(let err):
                print("get replaced recipe failure error : \(err.localizedDescription)")
            }
        }
    }
    
    func getExpire(){
        provider.request(.recommendAllExpireDateRecipes) { response in
            switch response {
            case .success(let result):
                do{
                    print("get expire recipe \(result.description)")
                    let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
                    self.expire = tmp
                }catch(let err){
                    print("get expire recipe parse error : \(err.localizedDescription)")
                }
            case .failure(let err):
                print("get expire recipe failure error : \(err.localizedDescription)")
            }
        }
    }
    
}
