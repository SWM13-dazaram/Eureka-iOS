//
//  MypageView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/19.
//

import SwiftUI

struct MypageView: View {
    @State var tmp = false
    var body: some View {
        ZStack{
            Color.bg
                .ignoresSafeArea()
                .navigationBarHidden(true)
            VStack{
                HStack{
                    MainTitle("Mypage".localized())
                    Spacer()
                    NavigationLink {
                        SettingView()
                    } label: {
                        MainButton("setting")
                    }
                }
                Spacer()
                Image("profile-default")
                    .clipShape(Circle())
                Text("아무개")
//                NavigationLink {
//                    SetProfileView(complete: $tmp)
//                } label: {
//                    EmptyButton(text: "Edit Profile".localized())
//                }
                Spacer()
            }
            .padding(.horizontal, 30)
        }
    }
}

struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MypageView()
                .navigationTitle("")
                .navigationBarHidden(true)
        }
    }
}
