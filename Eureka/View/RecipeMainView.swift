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
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ExpireDateView: View{
    @State var recipes = ExpireDataRecipe().getRecipes()
    
    var body: some View {
        TabView {
            ForEach(recipes, id: \.self.id){ idx in
                Content(recipe: idx)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct Content: View {
    @State var recipe: Recipe
    @State var description = ""
    
    var body: some View{
        VStack{
            Image(recipe.image)
                .resizable()
                .frame(width: 300, height: 200, alignment: .center)
                .cornerRadius(20)
            Text(recipe.name)
                .font(.system(size: 20, weight: .bold))
            Text(description)
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
                if let similarity = recipe.replaceIngredient {
                    Similarity(similarity)
                }
            }
            .padding()
        }
        .onAppear{
            if let replaced = recipe.replaceIngredient {
                let old = replaced.missingIngredient.name
                let new = replaced.ownIngredient.name
                description = "\(old) 대신 \(new)(이)가 있어요!"
            }
            if let expireDate = recipe.expireIngredient {
                description = "\(expireDate.name)의 유통기한이 임박했어요!"
            }
        }
    }
}

struct Similarity : View{
    let replaceIngredient: ReplaceIngredient
    let oldIngredient: String
    let newIngredient: String
    
    var body: some View{
        HStack{
            Text("\(oldIngredient)(이)랑 \(newIngredient)의 성분 유사도")
                .bold()
            Spacer()
            Text("\(replaceIngredient.Similarity)%")
                .bold()
                .foregroundColor(.green)
        }
        .padding()
        PercentBar(percentage: replaceIngredient.Similarity)
    }
    
    init(_ replaceIngredient: ReplaceIngredient){
        self.replaceIngredient = replaceIngredient
        self.oldIngredient = replaceIngredient.missingIngredient.name
        self.newIngredient = replaceIngredient.ownIngredient.name
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



//struct ReplaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReplaceView()
//            .previewInterfaceOrientation(.portrait)
//    }
//}
//

struct ExpireDateView_Previews: PreviewProvider {
    static var previews: some View {
        ExpireDateView()
            .previewInterfaceOrientation(.portrait)
    }
}
