////
////  MoyaAPI.swift
////  Eureka
////
////  Created by 김민령 on 2022/07/13.
////
//
//import Foundation
//import Moya
//
//enum API {
//    case recommendReplacedRecipe
//    case recommendAllExpireDateRecipes
//    case findAllUserIngredient
//    case findAllIngredientsByCategory
//}
//
//extension API: TargetType {
//    var baseURL: URL {
//        //수정
//        return URL(string: "https://62bbeeb36b1401736cecefcf.mockapi.io")!
//    }
//
//    var path: String {
//        switch self {
//        case .recommendReplacedRecipe:
//            return "/recommendReplacedRecipe"
//        case .findAllUserIngredient:
////            return "/api/v1/user-ingredients"
//            return "/findAllUserIngredient" //test용 uri
//        case .recommendAllExpireDateRecipes:
//            return "/recommendAllExpireDateRecipes" //test용 uri
//        case .findAllIngredientsByCategory:
//            return "/findAllIngredientsByCategory"
//        }
//    }
//
//    var method: Moya.Method {
//        switch self {
//        case .recommendReplacedRecipe, .findAllUserIngredient , .recommendAllExpireDateRecipes, .findAllIngredientsByCategory:
//            return .get
//        }
//    }
//
//    var task: Task {
//        //수정
//        switch self{
//        case .recommendReplacedRecipe, .findAllUserIngredient , .recommendAllExpireDateRecipes , .findAllIngredientsByCategory:
//            return .requestPlain
//        }
//    }
//
//    var headers: [String : String]? {
//        return ["Content-Type": "application/json"]
//    }
//
//    var sampleData: Data {
//        switch self {
//        case .recommendReplacedRecipe, .findAllUserIngredient , .recommendAllExpireDateRecipes , .findAllIngredientsByCategory:
//            return Data()
//        }
//    }
//
//}
