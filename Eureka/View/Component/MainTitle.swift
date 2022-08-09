
import SwiftUI

struct MainTitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(.title)
            .font(.system(size: 24, weight: .bold))
    }
    
    init(_ text: String) {
        self.text = text
    }
}
