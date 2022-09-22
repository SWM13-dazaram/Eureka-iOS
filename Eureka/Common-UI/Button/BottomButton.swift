
import SwiftUI

struct BottomButton: View {
    let text: String
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width-30, height: 56, alignment: .center)
                .foregroundColor(.appGreen)
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.white)
        }
    }
}
