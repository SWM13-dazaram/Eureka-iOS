import SwiftUI

struct IngredientIcon : View {
    let image: Image
    let days: Int
    let size: CGFloat
    
    init(_ name: String, _ days: Int = 0, size: CGFloat = 48){
        self.image = Image(name)
        self.days = days
        self.size = size
    }
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.barBackground, lineWidth: 1)
                .frame(width: size, height: size)
            image
                .frame(width: size, height: size)
            if(days<0){
                Image("alert")
                    .offset(x:20,y:-20)
            }
        }
    }
}
