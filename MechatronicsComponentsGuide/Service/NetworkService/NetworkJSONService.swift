import Foundation
import Alamofire
 
class NetworkAlamofireService {
    //MARK: - singleton
    static let shared = NetworkAlamofireService()
    private init() {}
    let decoder = JSONDecoder()
    
    func generateUrl() -> URL? {
        let tunnel = ""
        let server = ""
        let endPoint = ""
        
        let result = tunnel + server + endPoint
        return URL(string: result)
    }
    
    func fetchData() {
                
    }
    
}


