//
//  IngredientView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/28.
//

import SwiftUI

struct IngredientView: View {
    @StateObject var ingredient = IngredientMockAPI()
    
    var body: some View {
        ZStack{
            Color.bg
                .ignoresSafeArea()
            GeometryReader { proxy in
                VStack(alignment:.leading){
                    Spacer()
                    HStack{
                        MainTitle("식재료 보관함")
                            .frame(width: 138, height: 35)
                        Spacer()
                    }
                    Text(" 총 \(ingredient.userIngredient.count)개")
                        .offset(x:30)
                        .font(.system(size: 15))
                        .foregroundColor(.title)
                    List(ingredient.userIngredient, id: \.self.id){data in
                        ingredientCell(data)
                            .listRowBackground(Color.bg)
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
