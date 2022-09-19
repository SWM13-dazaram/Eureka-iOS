//
//  WhiteButton.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/25.
//

import SwiftUI

struct WhiteButton: View {
    @State var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.appGreen)
            .font(.system(size: 14))
            .padding(.init(top: 13, leading: 38, bottom: 13, trailing: 38))
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(color: .shadow, radius: 6, x: 0, y: 3)
            }
        
    }
}
