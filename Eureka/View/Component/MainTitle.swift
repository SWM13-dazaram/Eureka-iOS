
import SwiftUI

struct Title: View {
    let text: String
    let titleWdith: CGFloat?
    let titleHeight: CGFloat?
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(.title)
            .font(.system(size: 24, weight: .bold))
            .frame(width: titleWdith, height: titleHeight)
    }
    
    init(_ text: String, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.text = text
        self.titleWdith = width
        self.titleHeight = height
    }
}


struct MainTitle: View {
    let title: Title
    
    init(_ title: String, width: CGFloat? = nil, height: CGFloat? = nil){
        self.title = Title(title, width: width, height: height)
    }
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 30)
            HStack{
                title
                Spacer()
            }
        }
    }
}
