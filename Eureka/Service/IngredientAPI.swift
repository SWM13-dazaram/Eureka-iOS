
import Foundation
import Moya

enum IngredientAPI {
    case findAllUserIngredient //not API
    case findAllIngredient(categoryId: String)
    case deleteUserIngredient //not API
    case modifyUserIngredient //not API
    case getSelectedIngredientInfo(data: [Int])
    case setSelectedIngredient
    case createCustomIngredient //not API
    case createUserIngredient //not API
}

extension IngredientAPI: TargetType {
    var baseURL: URL {
        // FIXME: 도메인 나오면 수정
        return URL(string: "http://43.200.202.57:8080")!
    }
    
    var path: String {
        switch self {
        case .findAllUserIngredient:
            return "/user-ingredient"
        case .deleteUserIngredient:
            return "/user-ingredient"
        case .modifyUserIngredient:
            return "/user-ingerdient"
        case .getSelectedIngredientInfo:
            return "/api/v1/ingredients/selected"
        case .setSelectedIngredient:
            return "/api/v1/ingredients/store"
        case .createCustomIngredient:
            return "custom-ingredient"
        case .createUserIngredient:
            return "/user-ingredient"
        case .findAllIngredient:
            return "/api/v1/ingredients/categories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .findAllUserIngredient, .findAllIngredient:
            return .get
        case .getSelectedIngredientInfo, .setSelectedIngredient, .createCustomIngredient, .createUserIngredient:
            return .post
        case .deleteUserIngredient:
            return .delete
        case .modifyUserIngredient:
            return .put
        }
    }
    
    var task: Task {
        switch self{
        case .findAllIngredient(let categoryId):
            return .requestParameters(parameters: ["categoryId" : categoryId], encoding: URLEncoding.queryString)
        case .getSelectedIngredientInfo(let data):
            return .requestJSONEncodable(data)
        case .setSelectedIngredient:
            return .requestJSONEncodable([UserIngredient].self as! Encodable)
        // FIXME: BE랑 상의후 작성
        case .findAllUserIngredient, .deleteUserIngredient, .modifyUserIngredient, .createCustomIngredient, .createUserIngredient :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
//    var sampleData: Data {
//        switch self {
//        case .findAllUserIngredient, .deleteUserIngredient, .modifyUserIngredient, .getSelectedIngredientDetails, .createCustomIngredient, .createUserIngredient:
//            return Data()
//        }
//    }
    
}
