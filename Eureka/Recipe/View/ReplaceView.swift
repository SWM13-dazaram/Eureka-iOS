//
//  ReplaceView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/20.
//

import SwiftUI

// @TODO: BUGFIX ING..
struct ReplaceView: View {
    @ObservedObject var recipeVM = ReplaceRecipeVM()
    @State var selected = 0
    let proxy: GeometryProxy
    
    var body: some View {
        Group {
            switch recipeVM.recipeNetwork {
            case .loading :
                LoadingView()
            case .empty :
                RecipeNoneView()
            case .error :
                ErrorView()
            case .success :
                TabView(selection: $selected){
                    ForEach(recipeVM.recipe!, id: \.self.id) { idx in
                        NavigationLink {
                            RecipeDetailView(recipe: idx)
                        } label: {
                            RecipeContent(recipe: idx, proxy: proxy)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .onAppear{
                    self.setupAppearance()
                }
            }
        }
        .onAppear{
            recipeVM.getRecipe()
        }
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.appGreen)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.barBackground)
      }
}


//struct ReplaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReplaceView()
//            .previewInterfaceOrientation(.portrait)
//    }
//}

