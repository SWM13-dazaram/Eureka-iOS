import SwiftUI

struct ingredientCell : View {
    @State var userData: UserIngredient
    @State var dateCal: DateCalculater
    @State var expireDate = 0
    
    init(_ ingredient: UserIngredient){
        self.userData = ingredient
        self.dateCal = DateCalculater()
    }
    
    var body: some View {
        HStack{
            IngredientIcon(userData.ingredient.icon, expireDate)
                .padding(.trailing, 5)
            VStack{
                HStack{
                    Text(userData.name)
                        .font(.system(size: 14))
                        .foregroundColor(.appBlack)
                    Spacer()
                    expireText(expireDate)
                    Text(userData.expireDate)
                        .font(.system(size: 11))
                        .foregroundColor(.appGray)
                }
                .padding(.top, 5)
                expireBar(expireDate)
            }
        }
        .padding(15)
        .onAppear{
            self.expireDate = dateCal.compareToday(A: userData.expireDate)
        }
    }
}

struct expireText : View {
    let days: Int
    var text: String
    var textColor: Color
    let dateCal = DateCalculater()
    
    init(_ days: Int){
        self.days = days
        if(days > 0){
            text = "\(days)일 남음"
        }else if(days==0){
            text = "오늘까지"
        }else {
            text = "\(-days)일 지남"
        }
        self.textColor = dateCal.ingredientColor(days: days)
    }
    var body: some View {
        Text(text)
            .font(.system(size: 11))
            .foregroundColor(textColor)
    }
}

struct expireBar : View {
    let days: CGFloat
    let dateCal = DateCalculater()
    let color: Color
    
    init(_ days: Int){
        self.color = dateCal.ingredientColor(days: days)
        if days < 0{
            self.days = 0
        }else if days >= 100 {
            self.days = 99
        }
        else{
            self.days = CGFloat(days)
        }
    }
    
    var body: some View {
        ZStack(alignment:.leading) {
            GeometryReader{ geo in
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(.barBackground)
                    .frame(height: 6)
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(color)
                    .frame(width: geo.size.width/100*(100-days), height: 6)
            }
        }
    }
}
