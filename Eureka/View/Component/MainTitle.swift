
import SwiftUI

struct MainTitle: View {
    var text: String
    
    var body: some View {
        HStack{
            Text(text)
                .bold()
                .foregroundColor(.title)
                .font(.system(size: 24, weight: .bold))
                .frame(width: 160, height: 69)
                .offset(x:30)
            Spacer()
        }
        
    }
    
    init(_ text: String) {
        self.text = text
    }
}
