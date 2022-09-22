//
//  ExpireDateView.swift
//  Eureka
//
//  Created by 김민령 on 2022/09/22.
//

import SwiftUI

struct ExpireDateView: View{
    @EnvironmentObject var recipeVM : MainRecipeVM
    let proxy: GeometryProxy
    
    var body: some View {
        switch recipeVM.expireResponse {
        case .loading :
            LoadingView()
        case .empty :
            RecipeNoneView()
        case .error :
            ErrorView()
        case .success:
            TabView {
                ForEach(recipeVM.expire!, id: \.self.id){ idx in
                    NavigationLink {
                        RecipeDetailView(recipe: idx)
//                            .ignoresSafeArea()
                    } label: {
                        RecipeContent(recipe: idx, proxy: proxy)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }

    }
}

//
//struct ExpireDateView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpireDateView()
//    }
//}
