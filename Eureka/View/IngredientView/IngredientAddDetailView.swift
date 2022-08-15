//
//  IngredientAddDetailView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/04.
//

import SwiftUI

struct IngredientAddDetailView: View {
    @Binding var revert: Bool
    @EnvironmentObject var addVM: AddIngredient
    @State var selected = 0
    @State var alert = false
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                MainTitle("세부정보 입력 (\(selected+1)/\(addVM.userIngredient.count))")
                Spacer()
            }
            HStack{
                Text("총 \(addVM.userIngredient.count)개의 식재료의 정보를 입력해주세요.")
                    .font(.system(size: 13))
                    .foregroundColor(.appBlack)
                Spacer()
            }
            TabView(selection: $selected){
                ForEach(addVM.userIngredient.indices, id: \.self) { index in
                    IngredientForm(formData: $addVM.userIngredient[index])
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Spacer()
            Button {
                alert = true
            } label: {
                BottomButton(text: "저장하기")
            }
            .alert("저장", isPresented: $alert, actions: {
                Button {
                    revert = false
                } label: {
                    Text("OK")
                        .foregroundColor(.appGreen)
                }
            })
        .padding(.horizontal, 30)
        }
    }
}

struct IngredientForm: View {
    @Binding var formData: UserIngredient
    @State var expire = Date()
    @State var today = Date()
    let dateCal = DateCalculater()
    @State var toggle = false
    
    var body: some View {
        VStack{
            IngredientIcon(formData.ingredient.icon, size: 84)
                .padding(.bottom)
            CustomForm(title: "품목명", text: $formData.name)
            DateForm(title: "등록일", range: Date()..., date: $today)
                .disabled(true)
            DateForm(title: "유통기한", range: Date()..., date: $expire)
                .onChange(of: self.expire) { newValue in
                    formData.expireDate = dateCal.changeDateToStr(date: self.expire)
                }
            CustomForm(title: "메모" , text: $formData.memo)
        }
        .onAppear{
            expire = dateCal.changeStrToDate(str: formData.expireDate)
        }
    }
}

struct CustomForm: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        HStack{
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 14))
            Spacer()
            TextField("\(title)을 입력하세요.", text: $text)
                .font(.system(size: 14))
                .frame(width: 250)
                .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.barBackground, lineWidth: 1)
                        .frame(width: 250, height: 44)
                }
        }
    }
}

struct IngredientAddDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientAddDetailView(revert: .constant(true))
            .environmentObject(AddIngredient())
    }
}

//struct StealthDatePicker: View {
//    @State private var date = Date()
//    var body: some View {
//        ZStack {
//            DatePicker("", selection: $date, in: ...Date(), displayedComponents: .date)
//                .datePickerStyle(.compact)
//                .labelsHidden()
//                .accentColor(.appGreen)
//            SwiftUIWrapper {
//                Text("달력")
//                .frame(width: 32, height: 32, alignment: .topLeading)
//            }
//            .allowsHitTesting(false)
//        }
//    }
//}
//
//// @TODO: 이해하기
//struct SwiftUIWrapper<T: View>: UIViewControllerRepresentable {
//    let content: () -> T
//    func makeUIViewController(context: Context) -> UIHostingController<T> {
//        UIHostingController(rootView: content())
//    }
//    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {}
//}
