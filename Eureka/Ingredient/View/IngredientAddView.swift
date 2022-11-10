//
//  IngredientAddView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/03.
//

import SwiftUI

struct IngredientAddView: View {
    @Binding var revert: Bool
    @EnvironmentObject var addVM: AddIngredientViewModel
    @State var search = ""
    @State var categoryId = "ETCC"
    @State var click = [Ingredient]()
    @Environment(\.presentationMode) var presentationMode
    
    init(revert: Binding<Bool>){
        self._revert = revert
    }
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("close")
                }
                Spacer()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .padding(.top)
            HStack{
                MainTitle("Adding Ingredient".localized())
                Spacer()
            }
            SearchContiner(placeholder: "식재료를 검색해보세요.", search: $search)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(addVM.allIngredient, id: \.self.category.id ){ idx in
                        Button {
                            categoryId = idx.category.id
                        } label: {
                            Text(idx.category.name)
                                .foregroundColor(categoryId == idx.category.id ? .white : Color.appGray)
                                .padding(.init(top: 7, leading: 18, bottom: 7, trailing: 18))
                                .background(categoryId == idx.category.id ? Color.appGreen : .barBackground)
                                .cornerRadius(20)
                        }
                    }
                }
            }
            .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 0))
            CategoryView(ingredient: $addVM.allIngredient ,category: $categoryId)
            Spacer()
            if addVM.countSelected() > 0 {
                NavigationLink{
                    IngredientAddDetailView(revert: $revert)
                        .onAppear{
                            addVM.getDefaultIngredientInfo()
                        }
                } label: {
                    BottomButton(text: "Adding Selected Ingredient".localized())
                }
            }
        }
        .onAppear{
            addVM.getAllIngredient()
        }
        .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

struct CategoryView: View{
    @Binding var ingredient: [CategoryIngredient]
    @Binding var category: String
    var columns: [GridItem] {
        [GridItem(.flexible(maximum: 70)),
         GridItem(.flexible(maximum: 70)),
         GridItem(.flexible(maximum: 70)),
         GridItem(.flexible(maximum: 70))]
    }
    
    var body: some View{
        ForEach(ingredient, id: \.self.category.id){ idx in
            if category == idx.category.id {
                HStack{
                    Text("\(idx.category.name)"+"All %d".localized(with: idx.ingredients.count, comment: "총갯수"))
                        .font(.system(size: 12))
                        .foregroundColor(.appBlack)
                    Spacer()
                    NavigationLink {
                        IngredientUserCustomView()
                    } label: {
                        Text("+"+"Adding Custom Ingredient".localized(comment: "유저 커스텀 식재료 추가"))
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
                    LazyVGrid(columns: columns, spacing: 20){
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
            .environmentObject(AddIngredientViewModel())
    }
}
