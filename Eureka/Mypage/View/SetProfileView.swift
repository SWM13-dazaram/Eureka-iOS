//
//  SetProfileView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/09.
//

import SwiftUI

struct SetProfileView: View {
    
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image = Image("profile-default")
    @State var name = ""
    @Binding var complete: Bool
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        VStack{
            HStack{
                MainTitle("Profile Title".localized()+":)")
                    .frame(width: 160)
                Spacer()
            }
            ZStack{
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Button {
                    showImagePicker.toggle()
                } label: {
                    Image("photo")
                }
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    loadImage()
                }) {
                    ImagePicker(image: $selectedUIImage)
                }
                .offset(x: 40, y: 40)
            }
            .padding()
            HStack{
                Text("Nickname".localized())
                    .foregroundColor(.appBlack)
                    .font(.system(size: 13, weight: .bold))
                Spacer()
            }
            ZStack{
                TextField("Input Nickname Please".localized(), text: $name)
                    .font(.system(size: 14))
                    .padding()
                RoundedRectangle(cornerRadius: 6)
                    .stroke()
                    .frame(height: 45)
                    .foregroundColor(name=="" ? .barBackground : .appBlack)
            }
            Spacer()
            // @TODO: 중복체크 기능 넣은 후 코드 변경
            if name != "" {
                Button {
                    complete = true
                } label: {
                    BottomButton(text: "Save".localized())
                }
            }
        }
        .padding(.init(top: 30, leading: 30, bottom: 0, trailing: 30))
    }
}
