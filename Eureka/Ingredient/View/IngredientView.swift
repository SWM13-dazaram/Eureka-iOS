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
        Group{
            switch ingredientVM.dataResponse {
            case .loading:
                LoadingView()
            case .empty:
                NoneView()
            case .error:
                ErrorView()
            case .success:
                ZStack{
                    Color.bg
                        .ignoresSafeArea()
                    VStack{
                        VStack{
                            HStack{
                                MainTitle("식재료 보관함", width: 138, height: 35)
                                NavigationLink(isActive: $addView) {
                                    IngredientAddView(revert: $addView)
                                } label: {
                                    MainButton("add")
                                }
                            }
                            HStack{
                                Text(" 총 \(ingredientVM.userIngredient.count)개")
                                    .font(.system(size: 15))
                                    .foregroundColor(.title)
                                Spacer()
                            }
                            
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
                        .listStyle(PlainListStyle())
                    }
                }
                .onAppear {
                    //스크롤 부드럽게
                    UIScrollView.appearance().isPagingEnabled = false
                }
                .navigationBarHidden(true)
            }
        }
        .onAppear{
            ingredientVM.getUserIngredient()
        }
    }
    
    func removeRow(at offsets: IndexSet){
        for index in offsets {
            ingredientVM.deleteUserIngredient(index: index)
        }
        
        //TODO: 테스트 해보기
//        ingredientVM.userIngredient.remove(atOffsets: offsets)
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            IngredientView()
//                .environmentObject(MockVM())
                .environmentObject(IngredientVM())
                .environmentObject(AddIngredientViewModel())
        }
    }
}
