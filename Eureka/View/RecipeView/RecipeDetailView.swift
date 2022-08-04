//
//  RecipeDetailView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/01.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @State var description = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack{
                LoadImage(recipe.image)
                    .frame(height: 350)
                RecipeName(recipe.name)
                if let replaced = recipe.replaceIngredient {
                    let old = replaced.missingIngredient.name
                    let new = replaced.ownIngredient.name
                    TextBubble(new:new, old:old)
                    Image("replacedInfo")
                        .padding(.init(top: 50, leading: 0, bottom: 50, trailing: 0))
                }
                if let expireDate = recipe.expireIngredient {
                    TextBubble(expire:expireDate.name)
                    Image("expireInfo")
                        .padding(.init(top: 50, leading: 0, bottom: 50, trailing: 0))
                }
                VStack(alignment:.leading){
                    Text("내가 보유하고있는 재료!")
                        .font(.system(size: 15, weight: .bold))
                        .offset(x:30)
                    RecipeIngredientList(recipe)
                    Text("조리방법")
                        .font(.system(size: 15, weight: .bold))
                        .offset(x:30)
                        .padding(.init(top: 30, leading: 0, bottom: 20, trailing: 0))
                    ForEach(recipe.recipeSequenceList, id: \.self.number){ idx in
                        Sequence(idx)
                    }
                }
            }
        }
    }
}

enum Status : String {
    case replaced
    case expire
}


struct Sequence: View{
    let info: RecipeSequence
    init(_ info: RecipeSequence){
        self.info = info
    }
    var body: some View {
        HStack{
            VStack{
                Text(info.number.description)
                    .font(.system(size: 11))
                    .foregroundColor(.appGreen)
                    .padding(.init(top: 4, leading: 9, bottom: 4, trailing: 9))
                    .background{
                        Circle()
                            .foregroundColor(.bgGreen)
                    }
                // @TODO: 숫자와 텍스트필드 상대위치 , 꼭 개선하자..
                if(info.content.count > 30){
                    Spacer()
                }
            }
            Text(info.content)
                .font(.system(size: 12))
        }
        .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

//struct RecipeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeDetailView()
//    }
//}
