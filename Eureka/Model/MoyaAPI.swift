//
//  MoyaAPI.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/13.
//

import Foundation
import Moya

enum API {
    case recommendReplacedRecipe
//    case recommendAllExpireDateRecipes
}

extension API: TargetType {
    var baseURL: URL {
        //수정
        return URL(string: "https://068bf2cd-56c1-48ad-9236-22fd6260a576.mock.pstmn.io")!
    }
    
    var path: String {
        switch self {
        case .recommendReplacedRecipe:
            return "/api/v1/recipes/replacement"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recommendReplacedRecipe:
            return .get
        }
    }
    
    var task: Task {
        //수정
        switch self{
        case .recommendReplacedRecipe:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        switch self {
        case .recommendReplacedRecipe:
            return Data()
        }
    }
    
}
