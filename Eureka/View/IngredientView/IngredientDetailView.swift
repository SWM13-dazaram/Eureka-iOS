//
//  IngredientDetailView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/03.
//

import SwiftUI

struct IngredientDetailView: View {
    let userIngredient: UserIngredient
    
    init(_ userIngredient: UserIngredient){
        self.userIngredient = userIngredient
    }
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height:50)
            HStack{
                IngredientIcon(userIngredient.ingredient.icon, size: 78)
                VStack{
                    HStack{
                        Text(userIngredient.ingredient.name)
                            .foregroundColor(.appBlack)
                            .font(.system(size: 18))
                            .bold()
                        Spacer()
                    }
                    dateLine("등록일", userIngredient.insertDate)
                    dateLine("유통기한", userIngredient.expireDate)
                }
            }
            .padding(.init(top: 0, leading: 25, bottom: 0, trailing: 25))
            Text(userIngredient.memo)
                .foregroundColor(.appGray)
                .font(.system(size: 15))
                .padding()
                .frame(width: UIScreen.main.bounds.width-50 ,alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.barBackground, lineWidth: 1)
                )
            Spacer()
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

struct IngredientDetailView_Previews: PreviewProvider {
    static let test = UserIngredient(id: "1", insertDate: "2022/04/02", expireDate: "2022/09/02", memo: "메모입니다아", ingredient: Ingredient(id: 1, name: "고등어", icon: "https://picsum.photos/50/50"))
    
    static var previews: some View {
        IngredientDetailView(test)
    }
}
