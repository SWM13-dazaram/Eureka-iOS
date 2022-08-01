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
    case findAllUserIngredient
}

extension API: TargetType {
    var baseURL: URL {
        //수정
        return URL(string: "https://62bbeeb36b1401736cecefcf.mockapi.io")!
    }
    
    var path: String {
        switch self {
        case .recommendReplacedRecipe:
            return "/api/v1/recipes/replacement"
        case .findAllUserIngredient:
//            return "/api/v1/user-ingredients"
            return "/findAllUserIngredient" //test용 uri
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recommendReplacedRecipe, .findAllUserIngredient:
            return .get
        }
    }
    
    var task: Task {
        //수정
        switch self{
        case .recommendReplacedRecipe, .findAllUserIngredient:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        switch self {
        case .recommendReplacedRecipe, .findAllUserIngredient:
            return Data()
        }
    }
    
}
