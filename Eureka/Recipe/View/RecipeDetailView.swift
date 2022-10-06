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
            LoadImage(recipe.image)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .navigationBarTitleDisplayMode(.inline)
            VStack{
                RecipeName(recipe.title)
                // 식재료 대체 or 유통기한 판별해서 다른 view 노출
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
                    Text("My Ingredient".localized())
                        .font(.system(size: 15, weight: .bold))
                    RecipeIngredientList(recipe)
                    Text("Recipe".localized())
                        .font(.system(size: 15, weight: .bold))
                        .padding(.init(top: 30, leading: 0, bottom: 20, trailing: 0))
                    ForEach(recipe.recipeSequences, id: \.self.sequence){ idx in
                        Sequence(idx)
                    }
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

//TODO: RecipeType으로 통일
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
                Text(info.sequence.description)
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
    }
}

//struct RecipeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeDetailView()
//    }
//}
