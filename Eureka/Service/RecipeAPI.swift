import Foundation
import Moya

enum MainRecipeAPI {
    case recommendAllReplacedRecipes
    case recommendAllExpireDateRecipes
}

extension MainRecipeAPI: TargetType {
    var baseURL: URL {
        // FIXME: 도메인 나오면 수정
        return URL(string: "http://43.200.202.57:8080")!
    }
    
    var path: String {
        switch self {
        case .recommendAllReplacedRecipes:
            return "/api/v1/recipes/replacement"
        case .recommendAllExpireDateRecipes:
            return "/api/v1/recipes/expire-date"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recommendAllReplacedRecipes, .recommendAllExpireDateRecipes:
            return .get
        }
    }
    
    var task: Task {
        switch self{
        case .recommendAllReplacedRecipes, .recommendAllExpireDateRecipes:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "Authorization": "Bearer \(UserDefaults.token()!)"]
    }
    
//    var sampleData: Data {
//        switch self {
//        case .recommendAllReplacedRecipes, .recommendAllExpireDateRecipes:
//            return Data()
//        }
//    }
    
}
