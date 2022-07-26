import Foundation
import UIKit

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    var url: String
    
    init(url: String){
        self.url = url
        self.loadImageURL()
    }
    
    func loadImageURL(){
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let realData = data else {
                return
            }
            guard let realImage = UIImage(data: realData) else {
                return
            }
            self.image = realImage
            
        }.resume()
        
    }
}
