//
//  LoginView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/09.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

struct LoginView: View {
    @StateObject var oauth = Oauth()
    
    var body: some View {
        VStack{
            Text("신박한 레시피, 똑똑한 냉장고 정리엔")
                .foregroundColor(.appGray)
                .font(.system(size: 14))
                .padding(.init(top: 0, leading: 0, bottom: 1, trailing: 0))
            Text("유레카")
                .foregroundColor(.appBlack)
                .font(.system(size: 34, weight: .bold))
            Image("MainIcon")
            Spacer()
                .frame(height: 120)
            LongLineText("시작하기")
            .padding(.bottom)
            NavigationLink(destination: SetProfileView(), tag: true, selection: $oauth.success) {}
            Button {
                oauth.kakaoLogin()
            } label: {
                Image("KakaoLogin")
            }

            Button {
                oauth.appleLogin()
            } label: {
                Image("AppleLogin")
            }

            Spacer()
                .frame(height: 80)
            HStack{
                Text("이미 회원이라면?")
                    .foregroundColor(.appGray)
                    .font(.system(size: 12))
                Button {
                    print("로그인하기 버튼")
                } label: {
                    Text("로그인하기")
                        .foregroundColor(.appGreen)
                        .font(.system(size: 12, weight: .bold))
                        .underline()
                }
            }
        }
        .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

struct LongLineText: View {
    let text: String
    
    init(_ text: String){
        self.text = text
    }
    
    var body: some View {
        HStack{
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.appGray)
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20))
            Text(text)
                .foregroundColor(.appGray)
                .font(.system(size: 12))
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.appGray)
                .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
