import SwiftUI

struct IngredientIcon : View {
    let image: Image
    let color: Color
    let size: CGFloat
    
    init(_ url: String, _ status: Status? = nil, size: CGFloat = 48) {
        self.image = Image(url)
        self.size = size
        if status == nil {
            self.color = .bgGreen
        }
        else{
            switch status! {
            case .replaced:
                self.color = .appGreen
            case .expire:
                self.color = .appRed
            }
        }
    }
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(color , lineWidth: 1)
                .frame(width: size, height: size)
            image
                .frame(width: size, height: size)
                .clipShape(Circle())        }
    }
    
}

struct IngredientIconWithExpire : View {
    //    let image: LoadImage
        let image: Image
        let days: Int
        let size: CGFloat
        let dateCal = DateCalculater()
        
        init(_ url: String, _ days: Int = 0, size: CGFloat = 48){
    //        self.image = LoadImage(url)
            self.image = Image(url)
            self.days = days
            self.size = size
        }
        
        var body: some View {
            ZStack{
                Circle()
                    .stroke(size == 48 ? dateCal.ingredientColor(days: days) : Color.barBackground, lineWidth: 1)
                    .frame(width: size, height: size)
                image
                    .frame(width: size, height: size)
                    .clipShape(Circle())
                if(days<0){
                    Image("alert")
                        .offset(x:20,y:-20)
                }
            }
        }
}
