
import Foundation
import Moya

enum IngredientAPI {
    case findAllUserIngredient(userId: Int)
    case deleteUserIngredient(userId: Int, userIngredientId: Int)
    case modifyUserIngredient(userId: Int)
    case getSelectedIngredientDetails
    case createCustomIngredient
    case createUserIngredient
}

extension IngredientAPI: TargetType {
    var baseURL: URL {
        // FIXME: 도메인 나오면 수정
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
        case .findAllUserIngredient(let userId):
            return "/user-ingredient/\(userId)"
        case .deleteUserIngredient(let userId, let userIngredientId):
            return "/user-ingredient/\(userId)/\(userIngredientId)"
        case .modifyUserIngredient(let userId):
            return "/user-ingerdient/\(userId)"
        case .getSelectedIngredientDetails:
            return "ingredient/selected" // TODO: 회의하고 변경 사항 있으면 적용
        case .createCustomIngredient:
            return "custom-ingredient" // TODO: 회의하고 변경 사항 있으면 적용
        case .createUserIngredient:
            return "/user-ingredient"
        
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .findAllUserIngredient:
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
        // FIXME: BE랑 상의후 작성
        switch self{
        case .findAllUserIngredient, .deleteUserIngredient, .modifyUserIngredient, .getSelectedIngredientDetails, .createCustomIngredient, .createUserIngredient:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        switch self {
        case .findAllUserIngredient, .deleteUserIngredient, .modifyUserIngredient, .getSelectedIngredientDetails, .createCustomIngredient, .createUserIngredient:
            return Data()
        }
    }
    
}
