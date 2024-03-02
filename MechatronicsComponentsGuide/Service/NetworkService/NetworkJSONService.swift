import Foundation
import Alamofire
 
class NetworkAlamofireService {
    //MARK: - singleton
    static let shared = NetworkAlamofireService()
    private init() {}
    let decoder = JSONDecoder()
    
    func generateUrl() -> String {
        let tunnel = ""
        let server = ""
        let endPoint = ""
        let result = tunnel + server + endPoint
        return result
    }
    
    func fetchData(completion: @escaping (Result<WeatherResult,Error>) -> ()) {
        AF.request(generateUrl()).validate().response { [self] response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }
            
            guard let result = try? decoder.decode(WeatherResult.self, from: data)
            else {
                return
            }
            completion(.success(result))
        }
    }
}
