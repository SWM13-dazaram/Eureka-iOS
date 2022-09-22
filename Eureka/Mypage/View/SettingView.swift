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
                Text("Notice".localized())
            }
            HStack{
                Text("Version Info".localized())
                Spacer()
                Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String)
                    .foregroundColor(.appGray)
            }

            Button {
                sendMail.toggle()
            } label: {
                Text("Contact".localized())
            }
            .sheet(isPresented: $sendMail) {
                EmailSender()
            }
            Button {
                logoutAelrt.toggle()
            } label: {
                Text("Logout".localized())
            }
            .alert("Logout".localized(), isPresented: $logoutAelrt) {
                Button("Yes".localized()) {
                    oauth.logout()
                }
                Button("No".localized()){
                    logoutAelrt.toggle()
                }
            } message: {
                Text("Logout Check Comment".localized())
            }
            Button {
                resignAelrt.toggle()
            } label: {
                Text("Leave".localized())
            }
            .alert("Leave".localized(), isPresented: $resignAelrt) {
                Button("Yes".localized()) {
                    oauth.resign()
                }
                Button("No".localized()){
                    resignAelrt.toggle()
                }
            } message: {
                Text("Leave Check Comment".localized())
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
