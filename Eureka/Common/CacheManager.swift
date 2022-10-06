//
//  CacheManager.swift
//  Eureka
//
//  Created by 김민령 on 2022/10/06.
//

import Foundation
import UIKit

class CacheManager {
    static let shared = NSCache<NSString, AnyObject>()
    
    private init() {}
}
