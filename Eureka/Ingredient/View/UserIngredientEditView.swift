//
//  UserIngredientEditView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/15.
//

import SwiftUI

struct UserIngredientEditView: View {
    @ObservedObject var ingredientVM = IngredientVM()
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
                    BottomButton(text: "Save".localized())
                }
                .alert("Modify".localized(), isPresented: $alert) {
                    Button {
                        ingredientVM.getUserIngredient()
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Ok".localized())
                    }
                } message: {
                    Text("Modify Text".localized())
                }
            }
        }
        .padding(.horizontal, 30)
    }
}
