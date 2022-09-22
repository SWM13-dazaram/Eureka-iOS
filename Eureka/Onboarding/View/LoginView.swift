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
import AuthenticationServices

struct LoginView: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var loginVM: LoginViewModel
//    @Binding var main: Bool
    @State var appleSignInDelegate: SignInWithAppleDelegate! = nil
    
    var body: some View {
        VStack{
            Text("App Title".localized())
                .foregroundColor(.appGray)
                .font(.system(size: 14))
                .padding(.init(top: 0, leading: 0, bottom: 1, trailing: 0))
            Text("App Name".localized())
                .foregroundColor(.appBlack)
                .font(.system(size: 34, weight: .bold))
            Image("MainIcon")
            Spacer()
                .frame(height: 120)
            HStack{
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.appGray)
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 20))
                Text("시작하기")
                    .foregroundColor(.appGray)
                    .font(.system(size: 12))
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.appGray)
                    .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
            }
            .padding(.bottom)
//            NavigationLink(destination: SetProfileView(complete: $main).navigationBarBackButtonHidden(true), tag: true, selection: $oauth.status) {}
            Button {
                loginVM.kakaoLogin()
            } label: {
                Image("KakaoLogin")
            }

            Button {
                appleLogin()
//                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image("AppleLogin")
            }

            Spacer()
                .frame(height: 80)
        }
        .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

extension LoginView {
    private func appleLogin() {
      appleSignInDelegate = SignInWithAppleDelegate {
        print("로그인 성공?: \($0)")
      }
      let request = ASAuthorizationAppleIDProvider().createRequest()
      request.requestedScopes = [.fullName, .email]
   
      let controller = ASAuthorizationController(authorizationRequests: [request])
      controller.delegate = appleSignInDelegate
      controller.presentationContextProvider = appleSignInDelegate
      controller.performRequests()
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
