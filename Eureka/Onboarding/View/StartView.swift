//
//  StartView.swift
//  Eureka
//
//  Created by 김민령 on 2022/09/22.
//

import Foundation
import SwiftUI

struct StartView: View {
    @State var splash = true
    //TODO: ViewModel 만들어서 옮기기
    @ObservedObject var networkManager = NetworkManager()
    @State var alertToggle = true
    
    var body: some View {
        Group{
            if splash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                            splash=false
                        }
                    }
            }
            else{
                Group{
                    if networkManager.isConnected {
                        ContentView()
                    }
                    else {
                        SplashView()
                            .alert("NetWork Status".localized(), isPresented: $alertToggle) {
                                Button("Ok".localized()) {
                                    alertToggle.toggle()
                                    //TODO: 리팩토링하기..
                                    //네트워크 상태 안좋으면 일단 종료 시키기
                                    exit(0)
                                }
                            } message: {
                                Text("Network Error".localized())
                            }
                    }
                }
            }
        }
    }
}
