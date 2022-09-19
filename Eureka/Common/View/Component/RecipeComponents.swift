import SwiftUI
import UIKit

struct RecipeName: View{
    let name: String
    
    init(_ name: String){
        self.name = name
    }
    var body: some View{
        Text(name)
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(.appBlack)
    }
}

struct TextBubble: View{
    var description: AttributedString
    
    init(new: String, old: String){
        description = AttributedString("\(old)대신 \(new)(이)가 있어요!")
        let oldCustom = description.range(of: old)!
        let newCustom = description.range(of: new)!
        description[oldCustom].foregroundColor = .appBlack
        description[newCustom].foregroundColor = .appGreen
        
    }
    
    init(expire: String){
        description = AttributedString("\(expire)의 유통기한이 임박했어요!")
        let expireCustom = description.range(of: expire)!
        description[expireCustom].foregroundColor = .appRed
    }
    
    var body: some View {
        Text(description)
            .font(.system(size: 14))
            .foregroundColor(.defaultText)
            .padding()
            .background {
                Image("TextBubble")
                    .resizable()
                    .shadow(color: .shadow, radius: 6, x: 0, y: 3)
                    .foregroundColor(.defaultText)
            }
    }
}
