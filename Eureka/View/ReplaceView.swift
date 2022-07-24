//
//  ReplaceView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/20.
//

import SwiftUI

struct ReplaceView: View {
    @State var recipes = ReplaceRecipe().getRecipes()
    
    var body: some View {
        TabView{
            ForEach(recipes, id: \.self.id) { idx in
                Content(recipe: idx)
            }
        }
        .onAppear{
            self.recipes = ReplaceRecipe().getRecipes()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct TmpView: View {
    @State var tmpText: String
    var body: some View {
        Text(tmpText)
    }
    init(_ text: String){
        self.tmpText = text
    }
}
struct Content: View {
    @State var recipe: replacedRecipe
    @State var oldIngredient = ""
    @State var newIngredient = ""
    
    var body: some View{
        VStack{
            Image(recipe.image)
                .resizable()
                .frame(width: 300, height: 200, alignment: .center)
                .cornerRadius(20)
            Text(recipe.name)
                .font(.system(size: 20, weight: .bold))
            Text("\(oldIngredient) 대신 \(newIngredient)(이)가 있어요!")
                .padding(.init(top: 5, leading: 30, bottom: 5, trailing: 30))
                .background(.white)
                .cornerRadius(50)
                .shadow(color: Color(white: 0.5, opacity: 0.5), radius: 1, x: 1, y: 1)
            VStack(alignment: .leading) {
                Text("내가 보유하고있는 재료!")
                    .bold()
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]){
                    ForEach(recipe.ownIngredientList, id: \.self.id ){ idx in
                        FrameText(text: idx.name)
                    }
                }
            }
            .padding()
            HStack{
                Text("\(oldIngredient)(이)랑 \(newIngredient)의 성분 유사도")
                    .bold()
                Spacer()
                Text("\(recipe.replaceIngredient.Similarity)%")
                    .bold()
                    .foregroundColor(.green)
            }
            .padding()
            PercentBar(percentage: recipe.replaceIngredient.Similarity)
            
        }
        .onAppear{
            oldIngredient = recipe.replaceIngredient.missingIngredient.name
            newIngredient = recipe.replaceIngredient.ownIngredient.name
        }
    }
}

struct FrameText : View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(Color.gray)
            .cornerRadius(50)
            .fixedSize()
    }
}

struct PercentBar: View {
    @State var percentage: Float
    let barSize = UIScreen.main.bounds.width-40
    
    var body: some View{
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 100)
                .frame(width: barSize, height: 10)
                .foregroundColor(.gray)
            RoundedRectangle(cornerRadius: 100)
                .frame(width: barSize * CGFloat(percentage), height: 10)
                .foregroundColor(.green)
        }
    }
    
    init(percentage: Int){
        self.percentage = Float(percentage) * 0.01
    }
}

struct ReplaceView_Previews: PreviewProvider {
    static var previews: some View {
        ReplaceView()
            .previewInterfaceOrientation(.portrait)
    }
}
