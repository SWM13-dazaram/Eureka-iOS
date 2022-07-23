//
//  ContentView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            BottomTabView()
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
