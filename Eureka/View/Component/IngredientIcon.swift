import SwiftUI

struct IngredientIcon : View {
    let image:LoadImage
    let days: Int
    
    init(_ url: String, _ days: Int = 0){
        self.image = LoadImage(url)
        self.days = days
    }
    
    var body: some View {
        ZStack{
            image
                .frame(width: 48, height: 48)
                .cornerRadius(100)
            if(days<0){
                Image("alert")
                    .offset(x:20,y:-20)
            }
        }
    }
}
