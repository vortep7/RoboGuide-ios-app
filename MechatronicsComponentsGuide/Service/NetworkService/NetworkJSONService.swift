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


