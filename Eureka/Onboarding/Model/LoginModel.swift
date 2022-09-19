//
//  LoginModel.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/22.
//

import Foundation

enum SocialType {
    case kakao
    case apple
}

struct SignIn {
    let token : Any
    let socialType: SocialType
}
