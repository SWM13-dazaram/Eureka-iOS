//
//  NotMVPView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/05.
//

import SwiftUI

struct NotMVPView: View {
    var body: some View {
        VStack{
            Image("TBD")
            Text("준비중입니다.")
            Text("조금만 기다려주세요 :)")
        }
        .foregroundColor(.appGray)
    }
}

struct NotMVPView_Previews: PreviewProvider {
    static var previews: some View {
        NotMVPView()
    }
}
