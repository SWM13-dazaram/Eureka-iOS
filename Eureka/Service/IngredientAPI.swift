
import Foundation
import Moya

enum IngredientAPI {
    case findAllUserIngredient
    case findAllIngredient(categoryId: String)
    case deleteUserIngredient(userIngredientId: Int)
    case updateUserIngredient(UserIngredient: UserIngredient)
    case getSelectedIngredientInfo(data: [Int])
    case setSelectedIngredient(data: [UserIngredient])
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
            return "/api/v1/user-ingredients"
        case .deleteUserIngredient(let userIngredientId):
            return "/api/v1/user-ingredients/\(userIngredientId)"
        case .updateUserIngredient:
            return "api/v1/user-ingredients"
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
        case .updateUserIngredient:
            return .put
        }
    }
    
    var task: Task {
        switch self{
        case .findAllIngredient(let categoryId):
            return .requestParameters(parameters: ["categoryId" : categoryId], encoding: URLEncoding.queryString)
        case .getSelectedIngredientInfo(let data):
            return .requestJSONEncodable(data)
        case .setSelectedIngredient(let data):
            return .requestJSONEncodable(data)
        case .updateUserIngredient(let data):
            return .requestJSONEncodable(data)
        case .findAllUserIngredient, .deleteUserIngredient, .createCustomIngredient, .createUserIngredient :
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
