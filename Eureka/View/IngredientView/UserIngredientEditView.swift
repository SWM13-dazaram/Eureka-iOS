//
//  UserIngredientEditView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/15.
//

import SwiftUI

struct UserIngredientEditView: View {
    @ObservedObject var ingredientVM = IngredientVM()
    @Binding var revert: Bool
    @State var data: UserIngredient
    let original: UserIngredient
    @State var alert = false
    
    init(_ data: UserIngredient, revert: Binding<Bool>){
        self.data = data
        original = data
        self._revert = revert
    }
    
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
                        revert = false
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
