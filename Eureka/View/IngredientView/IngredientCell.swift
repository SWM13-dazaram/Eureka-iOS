import SwiftUI

struct ingredientCell : View {
    @State var userData: UserIngredient
    @State var dateCal: DataCalculater
    @State var expireDate = 0
    
    init(_ ingredient: UserIngredient){
        self.userData = ingredient
        self.dateCal = DataCalculater()
    }
    
    var body: some View {
        HStack{
            IngredientIcon(userData.ingredient.icon)
                .offset(x: 15)
            GeometryReader{ geo in
                VStack{
                    HStack{
                        Text(userData.ingredient.name)
                            .font(.system(size: 14))
                            .foregroundColor(.appBlack)
                        Spacer()
                        expireText(expireDate)
                            .onAppear{
                                self.expireDate = dateCal.compareToday(A: userData.expireDate)
                            }
                        Text(userData.expireDate)
                            .font(.system(size: 11))
                            .foregroundColor(.appGray)
                    }
                    .padding(.init(top: 7, leading: 0, bottom: 0, trailing: 0))
                    expireBar()
                }
                .offset(x:30)
                .frame(width: geo.size.width-45)
            }
        }
        .padding(.init(top: 15, leading: 0, bottom: 15, trailing: 0))
    }
}

struct IngredientIcon : View {
    let image:LoadImage
    
    init(_ url: String){
        self.image = LoadImage(url)
    }
    
    var body: some View {
        ZStack{
            image
                .frame(width: 48, height: 48)
                .cornerRadius(100)
            Image("alert")
                .offset(x:20,y:-20)
            
        }
    }
}

struct expireText : View {
    let days: Int
    var text: String
    var textColor: Color
    
    init(_ days: Int){
        self.days = days
        if(days > 0){
            text = "\(days)일 남음"
            textColor = .appGreen
        }else if(days==0){
            text = "오늘까지"
            textColor = .appOrange
        }else {
            text = "\(-days)일 지남"
            textColor = .appRed
        }
    }
    var body: some View {
        Text(text)
            .font(.system(size: 11))
            .foregroundColor(textColor)
    }
}

struct expireBar : View {
    var body: some View {
        ZStack(alignment:.leading) {
            GeometryReader{ geo in
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(.barBackground)
                    .frame(height: 6)
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: geo.size.width*0, height: 6)
            }
        }
    }
}
