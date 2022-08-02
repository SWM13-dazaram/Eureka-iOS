//
//  ReplaceView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/20.
//

import SwiftUI

struct ReplaceView: View {
    @EnvironmentObject var recipeVM: RecipeMockAPI
    
    var body: some View {
        TabView{
            ForEach(recipeVM.replaced, id: \.self.id) { idx in
                NavigationLink {
                    RecipeDetailView(recipe: idx)
                        .ignoresSafeArea()
                } label: {
                    Content(recipe: idx)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ExpireDateView: View{
    @EnvironmentObject var recipeVM: RecipeMockAPI

    var body: some View {
        TabView {
            ForEach(recipeVM.expire, id: \.self.id){ idx in
                NavigationLink {
                    RecipeDetailView(recipe: idx)
                        .ignoresSafeArea()
                } label: {
                    Content(recipe: idx)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct Content: View {
    @State var recipe: Recipe
    @State var description = ""
    
    var body: some View{
        VStack(spacing:20){
            LoadImage(recipe.image)
                .frame(width: 300, height: 220, alignment: .center)
                .cornerRadius(22)
                .shadow(color: .shadow, radius: 6, x: 0, y: 3)
            RecipeName(recipe.name)
            if let replaced = recipe.replaceIngredient {
                let old = replaced.missingIngredient.name
                let new = replaced.ownIngredient.name
                TextBubble(new:new, old:old)
            }
            if let expireDate = recipe.expireIngredient {
                TextBubble(expire:expireDate.name)
            }
            VStack(alignment: .leading) {
                Text("내가 보유하고있는 재료!")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.appBlack)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]){
                    ForEach(recipe.ownIngredientList, id: \.self.id ){ idx in
                        FrameText(text: idx.name)
                    }
                }
                if let similarity = recipe.replaceIngredient {
                    Similarity(similarity)
                }
            }
            .offset(x:30)
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
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.appBlack)
            Spacer()
            Text("\(Int(replaceIngredient.similarity*100))%")
                .font(.system(size: 19, weight: .bold))
                .foregroundColor(.appGreen)
        }
        .frame(width: UIScreen.main.bounds.width-60)
        PercentBar(percentage: replaceIngredient.similarity)
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
    let barSize = UIScreen.main.bounds.width-60
    
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



//struct ReplaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReplaceView()
//            .previewInterfaceOrientation(.portrait)
//    }
//}


struct ExpireDateView_Previews: PreviewProvider {
    static var previews: some View {
        ReplaceView()
            .previewInterfaceOrientation(.portrait)
    }
}
