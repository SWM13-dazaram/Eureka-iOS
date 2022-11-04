//
//  UserModel.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/24.
//

import Foundation
import SwiftUI

enum LoginProvider : String{
    case KAKAO = "KAKAO"
    case APPLE = "APPLE"
}

//TODO: property wrapper로 리팩토링하기!!
extension UserDefaults {
    static func setToken(_ token: String){
        UserDefaults.standard.set(token, forKey: "TOKEN")
    }
    
    static func token() -> String? {
        return UserDefaults.standard.string(forKey: "TOKEN")
    }
    
    static func setProvider(_ provider: LoginProvider) {
        UserDefaults.standard.set(provider.rawValue, forKey: "PROVIDER")
    }
    
    static func provider() -> LoginProvider {
        let data = UserDefaults.standard.string(forKey: "PROVIDER")!
        return LoginProvider(rawValue: data)!
    }
    
    static func setLoginStatus(_ status: Bool) {
        UserDefaults.standard.set(status, forKey: "STATUS")
    }
    
    static func loginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "STATUS")
    }
    
    static func userName() -> String? {
        return UserDefaults.standard.string(forKey: "NAME")
    }
    
    static func userImage() -> String? {
        return UserDefaults.standard.string(forKey: "IMAGE")
    }
    
    static func removeAll() {
        UserDefaults.standard.removeObject(forKey: "TOKEN")
        UserDefaults.standard.removeObject(forKey: "STATUS")
        UserDefaults.standard.removeObject(forKey: "NAME")
        UserDefaults.standard.removeObject(forKey: "IMAGE")
    }
}

struct SigninInfo : Encodable {
    let accessToken: String
    let providerType: String
    
    init(token: String, provider: LoginProvider){
        self.accessToken = token
        switch provider {
        case .KAKAO:
            self.providerType = LoginProvider.KAKAO.rawValue
        case .APPLE:
            self.providerType = LoginProvider.APPLE.rawValue
        }
    }
}

struct JWT : Codable {
    let jwt: String
    let statusCode: Int?
}
