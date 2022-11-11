//
//  IngredientAddDetailView.swift
//  Eureka
//
//  Created by 김민령 on 2022/08/04.
//

import SwiftUI

struct IngredientAddDetailView: View {
    @Binding var revert: Bool
    @EnvironmentObject var addVM: AddIngredientViewModel
    @State var selected = 0
    @State var alert = false
    
    @State var pickerUp = false
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                MainTitle("Input Detail Information".localized()+" (\(selected+1)/\(addVM.userIngredient.count))")
                Spacer()
            }
            HStack{
                Text("All %d".localized(with: addVM.userIngredient.count)+"Input Detail Information Please".localized())
                    .font(.system(size: 13))
                    .foregroundColor(.appBlack)
                Spacer()
            }
            TabView(selection: $selected){
                ForEach(addVM.userIngredient.indices, id: \.self) { index in
                    IngredientForm(formData: $addVM.userIngredient[index], pickerUp: $pickerUp)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: selected)
            .transition(.slide)
            Spacer()
            if selected+1 == addVM.userIngredient.count {
                Button {
                    if pickerUp {
                        print(pickerUp)
                        pickerUp.toggle()
                    }
                    else{
                        print(alert)
                        alert = true
//                        revert = false
                        DispatchQueue.global().async {
                            addVM.setIngredientData()
                        }
                    }
                    
                } label: {
                    BottomButton(text: "Save".localized())
                }
                .alert("Save Text".localized(), isPresented: $alert){
                    Button {
                        print("button")
                        revert = false
                        addVM.resetTmpData()
                    } label: {
                        Text("Ok".localized())
                            .foregroundColor(.appGreen)
                    }
                }
            }
            else if selected+1 < addVM.userIngredient.count {
                Button {
                    withAnimation { selected+=1 }
                } label: {
                    BottomButton(text: "Next".localized())
                }
            }

        }
        .padding(.horizontal, 30)
    }
}

struct CustomForm: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack{
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 14))
            Spacer()
            TextField(placeholder, text: $text)
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
            .environmentObject(AddIngredientViewModel())
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
