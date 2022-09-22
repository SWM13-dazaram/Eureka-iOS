//
//  RecipeContentView.swift
//  Eureka
//
//  Created by 김민령 on 2022/09/22.
//

import SwiftUI

struct RecipeContent : View {
    @State var recipe: Recipe
    @State var description = ""
    let proxy: GeometryProxy
    
    var body: some View{
        ScrollView{
            VStack(spacing:20){
                LoadImage(recipe.image)
                    .frame(width: 300, height: 220, alignment: .center)
                    .cornerRadius(22)
                    .shadow(color: .shadow, radius: 6, x: 0, y: 3)
                RecipeName(recipe.title)
                if let replaced = recipe.replaceIngredient {
                    let old = replaced.missingIngredient.name
                    let new = replaced.ownIngredient.name
                    TextBubble(new:new, old:old)
                }
                if let expireDate = recipe.expireIngredient {
                    TextBubble(expire:expireDate.name)
                }
                VStack(alignment: .leading) {
                    Text("My Ingredient".localized())
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.appBlack)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]){
                        ForEach(recipe.ingredients, id: \.self.id ){ idx in
                            FrameText(text: idx.name)
                        }
                    }
                    if let similarity = recipe.replaceIngredient {
                        Similarity(similarity, proxy: proxy)
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

struct Similarity : View{
    let replaceIngredient: ReplaceIngredient
    let oldIngredient: String
    let newIngredient: String
    let proxy: GeometryProxy
    
    var body: some View{
        HStack{
            Text("%@ And %@ Similarity".localized(with: [oldIngredient, newIngredient]))
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.appBlack)
            Spacer()
            Text("\(Int(replaceIngredient.similarity*100))%")
                .font(.system(size: 19, weight: .bold))
                .foregroundColor(.appGreen)
        }
        .frame(width: proxy.size.width)
        PercentBar(percentage: replaceIngredient.similarity, barSize: proxy.size.width)
    }
    
    init(_ replaceIngredient: ReplaceIngredient, proxy: GeometryProxy){
        self.replaceIngredient = replaceIngredient
        self.oldIngredient = replaceIngredient.missingIngredient.name
        self.newIngredient = replaceIngredient.ownIngredient.name
        self.proxy = proxy
    }
}

struct FrameText : View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.defaultText)
            .font(.system(size: 13))
            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(Color.white)
            .cornerRadius(50)
            .fixedSize()
    }
}

struct PercentBar: View {
    @State var percentage: Float
    let barSize: CGFloat
    
    var body: some View{
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 100)
                .frame(width: barSize, height: 10)
                .foregroundColor(.barBackground)
            RoundedRectangle(cornerRadius: 100)
                .frame(width: barSize * CGFloat(percentage), height: 10)
                .foregroundColor(.appGreen)
        }
    }
    
}

//struct RecipeContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeContent()
//    }
//}
