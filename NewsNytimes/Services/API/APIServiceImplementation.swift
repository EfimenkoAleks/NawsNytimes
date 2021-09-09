//
//  APIServiceImplementation.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation
import Alamofire

class APIServiceImplementation {
    
    let baseUrl = "https://api.nytimes.com/svc/mostpopular/v2/"
    let clientId = "api-key=E7b7aqpeEq65jjAODAlcGgNEQcakSnFX"
    
    private enum Endpoint {
        case email
        case shared
        case viewed
        
        var path: String {
            switch self {
            case .email:
                return "emailed/30.json?"
            case .shared:
                return "shared/30/facebook.json?"
            case .viewed:
                return "viewed/30.json?"
            }
        }
    }
}

extension APIServiceImplementation: APIService {
    
    
    func getEmialedList(completionHandler: @escaping (APIModel) -> Void) {
        
        let url = baseUrl + Endpoint.email.path + clientId
        AF.request(url)
          .validate()
          .responseDecodable(of: APIModel.self) { (response) in
            guard let email = response.value else { return }
            print(email.results?.first?.title! ?? "")
            completionHandler(email)
            
          }
    }
    
    func getSharedList(completionHandler: @escaping (APIModel) -> Void) {
        
        let url = baseUrl + Endpoint.shared.path + clientId
        AF.request(url)
          .validate()
          .responseDecodable(of: APIModel.self) { (response) in
            guard let shared = response.value else { return }
            print(shared.results?.first?.title! ?? "")
            completionHandler(shared)
          }
    }
    
    func getViewedList(completionHandler: @escaping (APIModel) -> Void) {
        
        let url = baseUrl + Endpoint.viewed.path + clientId
        AF.request(url)
          .validate()
          .responseDecodable(of: APIModel.self) { (response) in
            guard let viewed = response.value else { return }
            print(viewed.results?.first?.title! ?? "")
            completionHandler(viewed)
          }
    }
}
