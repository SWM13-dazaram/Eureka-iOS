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
            VStack{
                HStack{
                    MainTitle("마이페이지")
                    Spacer()
                    NavigationLink {
                        SettingView()
                    } label: {
                        Image("setting")
                    }
                }
                Spacer()
                Image("profile-default")
                    .clipShape(Circle())
                Text("sladuf")
                NavigationLink {
                    SetProfileView(complete: $tmp)
                } label: {
                    EmptyButton(text: "프로필수정")
                }
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
