//
//  ReplaceView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/20.
//

import SwiftUI

// @TODO: BUGFIX ING..
struct ReplaceView: View {
    @EnvironmentObject var recipeVM : MainRecipeVM
    @State var selected = 0
    let proxy: GeometryProxy
    
    var body: some View {
        switch recipeVM.replacedResponse {
        case .loading :
            LoadingView()
        case .empty :
            RecipeNoneView()
        case .error :
            ErrorView()
        case .success :
            TabView(selection: $selected){
                ForEach(recipeVM.replaced!, id: \.self.id) { idx in
                    NavigationLink {
                        RecipeDetailView(recipe: idx)
                    } label: {
                        RecipeContent(recipe: idx, proxy: proxy)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }

    }
}


//struct ReplaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReplaceView()
//            .previewInterfaceOrientation(.portrait)
//    }
//}

