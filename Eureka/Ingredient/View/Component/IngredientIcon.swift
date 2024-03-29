import SwiftUI

struct IngredientIcon: View{
    let image: LoadImage
//    let image: Image
    let size: CGFloat
    let color: Color
    
    init(_ url: String, size: CGFloat = 48, status: Status? = nil){
        self.image = LoadImage(url)
//        self.image = Image(url)
        self.size = size
        switch status {
        case .replaced:
            self.color = Color.appGreen
        case .expire:
            self.color = Color.appRed
        case .none:
            self.color = Color.barBackground
        }
    }
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(color, lineWidth: 1)
                .frame(width: size, height: size)
                .background {
                    image
                        .frame(width: size/2, height: size/2)
                }
                .clipShape(Circle())
        }
        
    }
}

struct IngredientIconWithExpire : View {
//    let image: LoadImage
    let image: LoadImage
    let days: Int
    let size: CGFloat

    init(_ url: String, _ days: Int = 0, size: CGFloat = 48){
        self.image = LoadImage(url)
//        self.image = Image(url)
        self.days = days
        self.size = size
    }

    var body: some View {
        ZStack{
            Circle()
                .stroke(size == 48 ? DateCalculater.ingredientColor(days: days) : Color.barBackground, lineWidth: 1)
                .frame(width: size, height: size)
                .background {
                    image
                        .frame(width: size/2, height: size/2)
                }
                .clipShape(Circle())
            if(days<0){
                Image("alert")
                    .offset(x:20,y:-20)
            }
        }
    }
}
