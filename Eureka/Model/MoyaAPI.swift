//
//  MoyaAPI.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/13.
//

import Foundation
import Moya

enum API {
    case findAllUserIngredient(userId: Int)
    case deleteUserIngredient(userId: Int, userIngredientId: Int)
}

extension API: TargetType {
    var baseURL: URL {
        //수정
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
        case .findAllUserIngredient(let userId):
            return "/user-ingredient/\(userId)"
        case .deleteUserIngredient(let userId, let userIngredientId):
            return "/user-ingredient/\(userId)/\(userIngredientId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .findAllUserIngredient:
            return .get
        case .deleteUserIngredient:
            return .delete
        }
    }
    
    var task: Task {
        //수정
        switch self{
        case .findAllUserIngredient, .deleteUserIngredient:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        switch self {
        case .findAllUserIngredient, .deleteUserIngredient:
            return Data()
        }
    }
    
}
