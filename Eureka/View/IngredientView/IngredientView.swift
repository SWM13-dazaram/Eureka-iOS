//
//  IngredientView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/28.
//

import SwiftUI

struct IngredientView: View {
    @ObservedObject var ingredientVM: IngredientVM
    @State var revert = false
    
    init(){
        self.ingredientVM = IngredientVM()
        ingredientVM.getUserIngredient()
    }
    
    var body: some View {
            ZStack{
                Color.bg
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    VStack(alignment: .leading){
                        HStack{
                            MainTitle("식재료 보관함")
                                .frame(width: 138, height: 35)
                            Spacer()
                                .frame(height: 40)
                            NavigationLink(isActive: $revert) {
                                IngredientAddView(revert: $revert)
                            } label: {
                                Image("add")
                            }
                        }
                        Text(" 총 \(ingredientVM.userIngredient.count)개")
                            .font(.system(size: 15))
                            .foregroundColor(.title)
                    }
                    .padding(.horizontal, 30)
                    List{
                        ForEach(ingredientVM.userIngredient, id: \.self.id){
                            data in
                            NavigationLink {
                                IngredientDetailView(data)
                            } label: {
                                ingredientCell(data)
                                    .listRowBackground(Color.bg)
                            }
                        }
                        .onDelete(perform: removeRow)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .onAppear {
                //스크롤 부드럽게
                UIScrollView.appearance().isPagingEnabled = false
            }
            .navigationBarHidden(true)
    }
    
    func removeRow(at offsets: IndexSet){
        for index in offsets {
            ingredientVM.deleteUserIngredient(index: index)
        }
        ingredientVM.userIngredient.remove(atOffsets: offsets)
        // @TODO: API로도 삭제 요청하기
        
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            IngredientView()
                .environmentObject(MockVM())
        }
    }
}
