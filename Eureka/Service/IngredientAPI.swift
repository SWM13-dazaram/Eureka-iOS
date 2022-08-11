
import Foundation
import Moya

enum IngredientAPI {
    case findAllUserIngredient //not API
    case findAllIngredient
    case deleteUserIngredient //not API
    case modifyUserIngredient //not API
    case getSelectedIngredientDetails //not API
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
        case .getSelectedIngredientDetails:
            return "ingredient/selected"
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
        case .getSelectedIngredientDetails, .createCustomIngredient, .createUserIngredient:
            return .post
        case .deleteUserIngredient:
            return .delete
        case .modifyUserIngredient:
            return .put
        }
    }
    
    var task: Task {
        switch self{
        case .findAllIngredient:
            return .requestPlain
        // FIXME: BE랑 상의후 작성
        case .findAllUserIngredient, .deleteUserIngredient, .modifyUserIngredient, .getSelectedIngredientDetails, .createCustomIngredient, .createUserIngredient :
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
