//
//  NetworkService.swift
//  MechatronicsComponentsGuide
//
//  Created by Андрей Петров on 29.02.2024.
//

import Foundation
 
class NetworkService {
    static let shared = NetworkService()
    private init() {}
    let decoder = JSONDecoder()
    
    func generateUrl() -> URL? {
        let tunnel = ""
        let server = ""
        let endPoint = ""
        
        let result = tunnel + server + endPoint
        return URL(string: result)
    }
    
    func fetchData() async throws {
        guard let url = generateUrl() else
        {throw NetworkCustomErrors.badURL }
        
        do {
            let response = try await URLSession.shared.data(from: url)
        } catch {
            throw NetworkCustomErrors.badResponse
        }
//        let data = try decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: response.0)
                
    }
    
}


//func fetchData() async throws -> UserResults{    //синхронная функция которая может кидать ошибки
//    guard let url = generateURL() else {throw NetworkError.badUrl}
//    
//    //так как процесс трудоемкий - необходимо на время вызова данных приостановить выполнение функции (дабы прога не простаивала
//    let response = try await URLSession.shared.data(from: url)
//    let decoder = JSONDecoder()
//    let result = try decoder.decode(UserResults.self, from: response.0)
//    return result
//}
//
//func fetchData(completion: @escaping (Result<UserResults, Error>) -> ()) {
//    
//    guard let url = generateURL() else {
//        completion(.failure(NetworkErrors.badURL))
//        return }
//    
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        guard let data = data else {
//            completion(.failure(NetworkErrors.invalidData))
//            return
//        }
//        
//        let decoder = JSONDecoder()
//        do {
//            let userData = try decoder.decode(UserResults.self, from: data)
//            print(userData)
//            completion(.success(userData))
//        } catch {
//            completion(.failure(NetworkErrors.invalidData))
//        }
//    }.resume()
//}
