import Foundation
import Moya

enum UserAPI {
    case signin(data: SigninInfo)
    case getJwt
    case resign(data: String)
}

extension UserAPI: TargetType {
    var baseURL: URL {
        // FIXME: 도메인 나오면 수정
        return URL(string: "http://43.200.202.57:8080")!
    }
    
    var path: String {
        switch self {
        case .signin:
            return "/api/v1/login"
        case .resign:
            return ""
        case .getJwt:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signin, .resign, .getJwt:
            return .post
        }
    }
    
    var task: Task {
        switch self{
        case .signin(let data):
            return .requestJSONEncodable(data)
        case .resign, .getJwt:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
//    var sampleData: Data {
//        switch self {
//        case .signin, .getJwt:
//            return Data()
//        }
//    }
    
}
