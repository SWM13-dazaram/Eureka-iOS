//
//  IngredientAddView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/03.
//

import SwiftUI

struct IngredientAddView: View {
    @Binding var revert: Bool
    @EnvironmentObject var addVM: AddIngredient
    @ObservedObject var ingredientVM: IngredientVM
    @State var search = ""
    @State var category = "MEAT"
    @State var click = [Ingredient]()
    
    init(revert: Binding<Bool>){
        self._revert = revert
        self.ingredientVM = IngredientVM()
        ingredientVM.getAllIngredient()
    }
    
    var body: some View {
        VStack{
            HStack{
                MainTitle("식재료 등록")
                Spacer()
            }
            SearchContiner(placeholder: "식재료를 검색해보세요.", search: $search)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(ingredientVM.allIngredient, id: \.self.categoryId ){ idx in
                        Button {
                            category = idx.categoryId
                        } label: {
                            Text(idx.categoryName)
                                .foregroundColor(.white)
                                .padding(.init(top: 7, leading: 18, bottom: 7, trailing: 18))
                                .background(category == idx.categoryId ? Color.appGreen : .appGray)
                                .cornerRadius(20)
                        }
                    }
                }
            }
            .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 0))
            CategoryView(ingredient: $ingredientVM.allIngredient ,category: $category)
            Spacer()
            if addVM.countSelected() > 0 {
                NavigationLink{
                    IngredientAddDetailView(revert: $revert)
                        .onAppear{
                            addVM.getDefaultIngredientInfo()
                        }
                } label: {
                    BottomButton(text: "선택한 식재료 추가하기")
                }
            }
        }
        .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

struct CategoryView: View{
    @Binding var ingredient: [CategoryIngredient]
    @Binding var category: String
    
    var body: some View{
        ForEach(ingredient, id: \.self.categoryId){ idx in
            if category == idx.categoryId {
                HStack{
                    Text("\(idx.categoryName) 총 \(idx.ingredients.count)개")
                        .font(.system(size: 12))
                        .foregroundColor(.appBlack)
                    Spacer()
                    NavigationLink {
                        IngredientUserCustomView()
                    } label: {
                        Text("+직접추가")
                            .font(.system(size:11))
                            .foregroundColor(.appGreen)
                            .padding(.init(top: 5, leading: 12, bottom: 5, trailing: 12))
                            .overlay {
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.appGreen)
                            }
                    }
                }
                .padding(.bottom)
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]){
                        ForEach(idx.ingredients , id: \.self.id){ item in
                            IngredientButton(item)
                        }
                    }
                    .padding(.top)
                }
            }
        }
    }
}

struct IngredientAddView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientAddView(revert: .constant(true))
            .environmentObject(IngredientVM())
            .environmentObject(AddIngredient())
    }
}
