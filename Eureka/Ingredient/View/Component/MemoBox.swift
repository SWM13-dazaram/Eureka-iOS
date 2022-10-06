//
//  MemoBox.swift
//  Eureka
//
//  Created by 김민령 on 2022/10/06.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct MemoBox: View {
    @State var text: String
    @State var bound = UIScreen.main.bounds.height
    
    init(_ text: String){
        self.text = text
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.barBackground, lineWidth: 1)
            HStack{
                Text(text)
                    .foregroundColor(.defaultText)
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
            }
            //text 길이에 대비하여 텍스트 상자의 크기를 조절
            .background{
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: proxy.size)
                }
            }
            .onPreferenceChange(SizePreferenceKey.self) { size in
                print("height: \(size.height)")
                bound = size.height
            }
        }
        .frame(height: bound)
    }
}

//struct MemoBox_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoBox()
//    }
//}
