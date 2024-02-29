import Foundation
import UIKit

class NetworkImageService {
    static var shared = NetworkImageService()
    private init() {}
        
    func randomGeneratorOfDigit() -> String {
        let randomNumberInRange = Int.random(in: 400...410)
        let result = String(randomNumberInRange)
        return result
    }
    
    func fetchCatImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: "https://http.cat/" + randomGeneratorOfDigit()) else {
            completion(nil)
            return
        }

        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }

}


enum NetworkImageErrors: Error {
    case badImageURL
    case badImage
}
