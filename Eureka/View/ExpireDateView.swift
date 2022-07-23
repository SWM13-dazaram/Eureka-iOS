//
//  ExpireDateView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/20.
//

import SwiftUI

struct ExpireDateView: View {
    var body: some View {
        TabView{
            Text("유통기한 View")
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ExpireDateView_Previews: PreviewProvider {
    static var previews: some View {
        ExpireDateView()
    }
}
