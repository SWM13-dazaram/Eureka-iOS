//
//  SwiftUIView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/26.
//

import SwiftUI

struct LoadImage: View {
    @ObservedObject var loader: ImageLoader
    
    var body: some View {
        Image(uiImage: loader.image ?? UIImage())
            .resizable()
    }
    
    init(_ url: String){
        self.loader = ImageLoader(url: url)
    }
    
}
