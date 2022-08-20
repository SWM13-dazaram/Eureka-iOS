//
//  EmptyButton.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/19.
//

import SwiftUI

struct EmptyButton: View {
    @State var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.appGray)
            .padding(.init(top: 8, leading: 20, bottom: 8, trailing: 20))
            .overlay{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.barBackground, lineWidth: 1)
            }
    }
}

struct EmptyButton_Previews: PreviewProvider {
    static var previews: some View {
        EmptyButton(text: "버튼이름")
    }
}
