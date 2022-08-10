import Foundation

extension Bundle {
    
    var KAKAO_API_KEY: String {
        guard let file = self.path(forResource: "KeyInfo", ofType: "plist") else { return "" }
        
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        
        guard let key = resource["KAKAO_API_KEY"] as? String else {
            fatalError("KAKAO_API_KEY error")
        }
        return key
    }
}
