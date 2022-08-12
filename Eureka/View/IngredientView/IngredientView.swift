//
//  IngredientView.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/28.
//

import SwiftUI

struct IngredientView: View {
    @ObservedObject var mockVM: MockVM
    @State var revert = false
    
    init(){
        self.mockVM = MockVM()
        mockVM.getUserIngredient()
    }
    
    var body: some View {
            ZStack{
                Color.bg
                    .ignoresSafeArea()
                VStack(alignment:.leading){
                    Spacer()
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
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 30))
                    }
                    Text(" 총 \(mockVM.userIngredient.count)개")
                        .offset(x:30)
                        .font(.system(size: 15))
                        .foregroundColor(.title)
                    List{
                        ForEach(mockVM.userIngredient, id: \.self.id){
                            data in
                            NavigationLink {
                                IngredientDetailView(data)
                            } label: {
                                ingredientCell(data)
                                    .listRowBackground(Color.bg)
                            }
                        }
                        .onDelete(perform: removeList)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationBarHidden(true)
    }
    
    func removeList(at offsets: IndexSet){
        mockVM.userIngredient.remove(atOffsets: offsets)
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
