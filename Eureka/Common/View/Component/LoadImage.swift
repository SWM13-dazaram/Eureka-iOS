//
//  SwiftUIView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/26.
//

import SwiftUI
import Kingfisher

struct LoadImage: View {
    let url: String
    init(_ url : String){
        self.url = url
    }
    var body: some View {
        KFImage(URL(string: url)!)
            .resizable()
    }
}
