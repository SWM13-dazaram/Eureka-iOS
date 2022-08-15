import SwiftUI

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
