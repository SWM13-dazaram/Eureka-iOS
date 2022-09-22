import SwiftUI

extension Color {
    static let bg = Color("background")
    static let appGreen = Color("appGreen")
    static let title = Color("title")
    static let appGray = Color("appGray")
    static let shadow = Color("shadow")
    static let appBlack = Color("appBlack")
    static let defaultText = Color("defaultText")
    static let appRed = Color("appRed")
    static let appOrange = Color("appOrange")
    static let barBackground = Color("barBackground")
    static let bgGreen = Color("bgGreen")
    static let bgRed = Color("bgRed")
}


extension String {
    
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    func localized(with argument: CVarArg = [], comment: String = "") -> String {
        
        //argurment가 여러개일 경우
        if let arguments = argument as? [CVarArg] {
            return String(format: self.localized(comment: comment), arguments: arguments)
        }
        
        return String(format: self.localized(comment: comment), argument)
        
    }
    
}
