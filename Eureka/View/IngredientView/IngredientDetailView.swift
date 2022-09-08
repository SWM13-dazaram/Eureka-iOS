//
//  IngredientDetailView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/03.
//

import SwiftUI

struct IngredientDetailView: View {
    @Binding var userIngredient: UserIngredient
    
    init(_ userIngredient: Binding<UserIngredient>){
        self._userIngredient = userIngredient
    }
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height:50)
                .toolbar {
                    ToolbarItem{
                        NavigationLink {
                            UserIngredientEditView(data: userIngredient, original: userIngredient)
                        } label: {
                            Image("edit")
                        }
                    }
                }
            HStack{
                IngredientIcon(userIngredient.ingredient.icon, size: 78)
                VStack{
                    HStack{
                        Text(userIngredient.name)
                            .foregroundColor(.appBlack)
                            .font(.system(size: 18))
                            .bold()
                        Spacer()
                    }
                    dateLine("등록일", userIngredient.insertDate)
                    dateLine("유통기한", userIngredient.expireDate)
                }
            }
        }
    }
}


struct dateLine: View{
    let leadingText: String
    let trailingText: String
    
    init(_ leading: String, _ traling: String){
        self.leadingText = leading
        self.trailingText = traling
    }
    var body: some View{
        HStack{
            Text(leadingText)
            Spacer()
            Text(trailingText)
        }
        .foregroundColor(.defaultText)
        .font(.system(size: 12))
    }
}

//struct IngredientDetailView_Previews: PreviewProvider {
//    static let test = UserIngredient(id: 1, name: "고등어", insertDate: "2022/04/02", expireDate: "2022/09/02", memo: "메모입니다아", ingredient: Ingredient(id: 1, name: "고등어", icon: "https://picsum.photos/50/50"))
//
//    static var previews: some View {
//        IngredientDetailView(test)
//    }
//}
