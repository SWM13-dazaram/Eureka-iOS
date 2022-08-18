//
//  IngredientView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/28.
//

import SwiftUI

struct IngredientView: View {
    @EnvironmentObject var ingredientVM : IngredientVM
    @State var addView = false
    
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
                            NavigationLink(isActive: $addView) {
                                IngredientAddView(revert: $addView)
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
                        ForEach(ingredientVM.userIngredient.indices, id:\.self){
                            data in
                            NavigationLink {
                                IngredientDetailView($ingredientVM.userIngredient[data])
                                    .onAppear {
                                        print("IngredientDetailView: \(data)")
                                    }
                            } label: {
                                ingredientCell($ingredientVM.userIngredient[data])
                                    .listRowBackground(Color.bg)
                            }
                        }
                        .onDelete(perform: removeRow)
                    }
                    .onAppear{
                        ingredientVM.getUserIngredient()
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
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            IngredientView()
                .environmentObject(MockVM())
                .environmentObject(IngredientVM())
                .environmentObject(AddIngredient())
        }
    }
}
