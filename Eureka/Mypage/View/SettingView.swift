//
//  SettingView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/19.
//

import SwiftUI
import MessageUI

struct SettingView: View {
    @EnvironmentObject var oauth: LoginViewModel
    @State var logoutAelrt = false
    @State var resignAelrt = false
    @State var sendMail = false
    
    var body: some View {
        List{
            NavigationLink {
            } label: {
                Text("공지사항")
            }
            HStack{
                Text("버전정보")
                Spacer()
                Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)
                    .foregroundColor(.appGray)
            }

            Button {
                sendMail.toggle()
            } label: {
                Text("문의하기")
            }
            .sheet(isPresented: $sendMail) {
                EmailSender()
            }
            Button {
                logoutAelrt.toggle()
            } label: {
                Text("로그아웃")
            }
            .alert("로그아웃", isPresented: $logoutAelrt) {
                Button("네") {
                    oauth.logout()
                }
                Button("아니오"){
                    logoutAelrt.toggle()
                }
            } message: {
                Text("정말 로그아웃 하시겠습니까?")
            }
            Button {
                resignAelrt.toggle()
            } label: {
                Text("탈퇴하기")
            }
            .alert("탈퇴하기", isPresented: $resignAelrt) {
                Button("네") {
                    oauth.resign()
                }
                Button("아니오"){
                    resignAelrt.toggle()
                }
            } message: {
                Text("탈퇴하면 식재료 보관함을 비롯한 모든 데이터가 삭제됩니다. \n 정말 탈퇴 하시겠습니까?")
            }
        }
        .foregroundColor(.appBlack)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SettingView()
        }
    }
}
