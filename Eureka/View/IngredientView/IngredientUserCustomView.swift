//
//  IngredientUserCustomView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/05.
//

import SwiftUI


struct IngredientUserCustomView: View {
    @State var category = ""
    @State var name = ""
    @State var expire = Date()
    @State var memo = ""
    @State var iconModal = false
    
    var body: some View {
        VStack{
            HStack{
                MainTitle("식재료 직접입력")
                Spacer()
                Image("close")
            }
            Button {
                iconModal.toggle()
            } label: {
                IngredientIcon("mushroom", size: 94)
                    .padding(.init(top: 60, leading: 0, bottom: 60, trailing: 0))
                
            }
            .sheet(isPresented: self.$iconModal) {Text("식재료 아이콘 선택")}
            List {
                IngredientCategory()
                IngredientCustomForm(name: $name, expire: $expire, memo: $memo)
            }
            .listStyle(.plain)
            Button {
                
            } label: {
                BottomButton(text: "추가하기")
            }
        }
        .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}


let sample = ["채소", "과일"]

struct IngredientCategory: View {
    @State var category = "카테고리를 선택해주세요."
    var body: some View{
        HStack{
            Text("카테고리")
            Spacer()
            Picker(selection: $category) {
                ForEach(sample, id:\.self){
                    Text($0)
                }
            } label: {
                Text("카테고리를 선택해주세요.")
            }
            .accentColor(.appGray)
            .pickerStyle(.menu)
        }
        .foregroundColor(.appBlack)
        .font(.system(size: 14))
    }
}

struct IngredientCustomForm: View{
    @Binding var name: String
    @Binding var expire: Date
    @Binding var memo: String
    @State var today = Date()
    
    var body: some View{
        HStack{
            Text("품목명")
            Spacer()
                .frame(width: 50)
            TextField("품목명을 입력해주세요.", text: $name)
        }
        .foregroundColor(.appBlack)
        .font(.system(size: 14))
        DateForm(title: "등록일", range: Date()..., date: $today)
            .disabled(true)
        DateForm(title: "유통기한", range: Date()..., date: $expire)
        HStack{
            Text("메모")
            Spacer()
                .frame(width: 50)
            TextField("메모를 입력해주세요.", text: $memo)
        }
        .foregroundColor(.appBlack)
        .font(.system(size: 14))
    }
}

struct IngredientUserCustomView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientUserCustomView()
    }
}
