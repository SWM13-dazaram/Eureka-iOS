
import Foundation
import Moya

class MainRecipeVM: ObservableObject {
    let provider = MoyaProvider<MainRecipeAPI>()
    @Published var replaced : [Recipe]?
    @Published var replacedResponse = Response.loading
    @Published var expire : [Recipe]?
    @Published var expireResponse = Response.loading
    
    init(){
        print("MainRecipeVM init()")
    }
    
    func getReplaced(){
        provider.request(.recommendAllReplacedRecipes) { response in
            switch response {
            case .success(let result):
                do{
                    print("🤖 get replaced recipe \(result.description)")
                    if result.statusCode == 200 {
                        let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
                        self.replaced = tmp
                        self.replacedResponse = .success
                    }
                    else {
                        self.replacedResponse = .empty
                    }
                }catch(let err){
                    self.replacedResponse = .error
                    print("‼️ get replaced recipe parse error : \(err.localizedDescription)")
                }
            case .failure(let err):
                self.replacedResponse = .error
                print("‼️ get replaced recipe failure error : \(err.localizedDescription)")
            }
        }
    }
    
    func getExpire(){
        provider.request(.recommendAllExpireDateRecipes) { response in
            switch response {
            case .success(let result):
                do{
                    print("🤖 get expire recipe \(result.description)")
                    if result.statusCode == 200 {
                        let tmp = try JSONDecoder().decode([Recipe].self, from: result.data)
                        self.expire = tmp
                        self.expireResponse = .success
                    }
                    else{
                        self.expireResponse = .empty
                    }
                }catch(let err){
                    self.expireResponse = .error
                    print("‼️ get expire recipe parse error : \(err.localizedDescription)")
                }
            case .failure(let err):
                self.expireResponse = .error
                print("‼️ get expire recipe failure error : \(err.localizedDescription)")
            }
        }
    }
    
}
