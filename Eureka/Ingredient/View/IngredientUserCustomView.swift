//
//  IngredientUserCustomView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/05.
//

import SwiftUI


struct IngredientUserCustomView: View {
    @State var icon = "MainIcon"
    @State var category = ""
    @State var name = ""
    @State var expire = Date()
    @State var memo = ""
    @State var iconModal = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            Spacer()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            HStack{
                MainTitle("식재료 직접입력")
                Spacer()
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("close")
                }
            }
            Spacer()
            Button {
                iconModal.toggle()
            } label: {
                IngredientIcon(icon, size: 94)
                    .padding(.init(top: 60, leading: 0, bottom: 60, trailing: 0))
                
            }
            .sheet(isPresented: self.$iconModal) {SelectIconSheet(close: $iconModal, icon: $icon)}
            List {
                IngredientCategory()
                IngredientCustomForm(name: $name, expire: $expire, memo: $memo)
            }
            .listStyle(.plain)
            if(icon != "MainIcon" && name != ""){
                Button {
                    //FIXME: API
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    BottomButton(text: "추가하기")
                }
            }
        }
        .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}


let sample = ["채소", "과일"]

struct SelectIconSheet : View{
    @Binding var close: Bool
    @Binding var icon: String
    @EnvironmentObject var addVM: AddIngredient
    var columns: [GridItem] {
        [GridItem(.flexible(maximum: 64)),
         GridItem(.flexible(maximum: 64)),
         GridItem(.flexible(maximum: 64)),
         GridItem(.flexible(maximum: 64))]
    }
    
    init(close: Binding<Bool>, icon: Binding<String>){
        self._icon = icon
        self._close = close
    }
    
    var body: some View{
        VStack{
            HStack{
                Text("식재료 아이콘 선택")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                Spacer()
                Button {
                    close.toggle()
                } label: {
                    Image("close")
                }
            }
            .padding()
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(addVM.allIngredient, id: \.self.categoryId ){ idx in
                        ForEach(idx.ingredients, id:\.self.id){ data in
                            Button {
                                icon = data.icon
                                close.toggle()
                            } label: {
                                IngredientIcon(data.icon, size: 64)
                            }

                        }
                    }
                }
            }
        }
        .padding(.horizontal, 30)
    }
}

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
