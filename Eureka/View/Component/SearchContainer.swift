//
//  SearchContainer.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/11.
//

import SwiftUI

struct SearchContiner: View{
    @State var placeholder: String
    @Binding var search: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.barBackground, lineWidth: 1)
                .frame(height: 44)
            HStack{
                TextField(placeholder, text: $search)
                    .foregroundColor(.appGray)
                Spacer()
                Image("search")
            }
            .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    }
}

