//
//  IngredientAddView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/03.
//

import SwiftUI
import Alamofire

struct IngredientAddView: View {
    @EnvironmentObject var addVM: AddIngredient
    @ObservedObject var mockVM: MockVM
    @State var searchText = ""
    @State var category = 1
    @State var click = [Ingredient]()
    
    init(){
        self.mockVM = MockVM()
        mockVM.getAllIngredient()
    }
    
    var body: some View {
        VStack{
            HStack{
                MainTitle("식재료 등록")
                Spacer()
            }
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.barBackground, lineWidth: 1)
                    .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
                    .frame(height: 44)
                HStack{
                    TextField("식재료를 검색해보세요", text: $searchText)
                        .foregroundColor(.appGray)
                    Spacer()
                    Image("search")
                }
                .padding(.init(top: 0, leading: 40, bottom: 0, trailing: 40))
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(mockVM.allIngredient, id: \.self.categoryId ){ idx in
                        Button {
                            category = Int(idx.categoryId)!
                            //mockAPI categoryId String
                        } label: {
                            Text(idx.categoryName)
                                .foregroundColor(.white)
                                .padding(.init(top: 7, leading: 18, bottom: 7, trailing: 18))
                                .background(Color.appGreen)
                                .cornerRadius(20)
                        }
                    }
                }
            }
            .padding(.init(top: 20, leading: 30, bottom: 20, trailing: 30))
            CategoryView(ingredient: $mockVM.allIngredient ,category: $category)
                .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
            Spacer()
            if addVM.countSelected() > 0 {
                NavigationLink {
                    IngredientAddDetailView()
                } label: {
                    BottomButton(text: "선택한 식재료 추가하기")
                }
            }
        }
    }
}

struct CategoryView: View{
    @Binding var ingredient: [CategoryIngredient]
    @Binding var category: Int
    
    var body: some View{
        ForEach(ingredient, id: \.self.categoryId){ idx in
            if category == Int(idx.categoryId)! { //mockAPI categoryId String
                HStack{
                    Text("\(idx.categoryName) 총 \(idx.ingredients.count)개")
                        .font(.system(size: 12))
                        .foregroundColor(.appBlack)
                    Spacer()
                    Text("+직접추가")
                        .font(.system(size:11))
                        .foregroundColor(.appGreen)
                        .padding(.init(top: 5, leading: 12, bottom: 5, trailing: 12))
                        .overlay {
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.appGreen)
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
        IngredientAddView()
            .environmentObject(MockVM())
            .environmentObject(AddIngredient())
    }
}
