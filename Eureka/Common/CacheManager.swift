//
//  CacheManager.swift
//  Eureka
//
//  Created by 김민령 on 2022/10/06.
//

import Foundation
import UIKit

enum CacheKey : String{
    case replcedRecipe
    case expireRecipe
}

class CacheManager {
    static let shared = NSCache<NSString, AnyObject>()
    
    private init() {}
    
    static func customObject(key: CacheKey) -> AnyObject? {
        return shared.object(forKey: key.rawValue as NSString)
    }
    
    static func setCustomObject(key: CacheKey, object : AnyObject) {
        shared.setObject(object, forKey: key.rawValue as NSString)
    }
    
    static func removeCustomObject(key : CacheKey) {
        shared.removeObject(forKey: key.rawValue as NSString)
    }
}
