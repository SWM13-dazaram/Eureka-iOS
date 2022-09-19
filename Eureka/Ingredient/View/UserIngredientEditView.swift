//
//  UserIngredientEditView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/15.
//

import SwiftUI

struct UserIngredientEditView: View {
    @EnvironmentObject var ingredientVM: IngredientVM
    @State var data: UserIngredient
    let original: UserIngredient
    @State var alert = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            IngredientForm(formData: $data)
            if original.name != data.name || original.expireDate != data.expireDate || original.memo != data.memo {
                Button {
                    ingredientVM.updateUserIngredient(data: data)
                    alert = true
                } label: {
                    BottomButton(text: "저장하기")
                }
                .alert("수정", isPresented: $alert) {
                    Button {
                        ingredientVM.getUserIngredient()
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("OK")
                    }
                } message: {
                    Text("수정되었습니다.")
                }
            }
        }
        .padding(.horizontal, 30)
    }
}
