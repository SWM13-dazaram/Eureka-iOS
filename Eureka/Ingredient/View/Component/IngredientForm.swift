import SwiftUI

struct IngredientForm: View {
    @Binding var formData: UserIngredient
    @State var expire = Date()
    @State var today = Date()
    @State var toggle = false
    
    var body: some View {
        VStack{
            IngredientIcon(formData.ingredient.icon, size: 84)
                .padding(.bottom)
            CustomForm(title: "Ingredient Name".localized(), placeholder: "Input Ingredient Name Please".localized(), text: $formData.name)
            DateForm(title: "Insert Date".localized(), range: Date()..., date: $today)
                .disabled(true)
            DateForm(title: "Expire".localized(), range: Date()..., date: $expire)
                .onChange(of: self.expire) { newValue in
                    formData.expireDate = DateCalculater.changeDateToStr(date: self.expire)
                }
            CustomForm(title: "Memo".localized(), placeholder: "Input Memo Please".localized() , text: $formData.memo)
        }
        .onAppear{
            expire = DateCalculater.changeStrToDate(str: formData.expireDate)
        }
    }
}
