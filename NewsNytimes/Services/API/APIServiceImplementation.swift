//
//  APIServiceImplementation.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation
import Alamofire

enum CuntomError: Error {
    case noData
}

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
    
    
    func getEmialedList(completionHandler: @escaping (Result<APIModel, CuntomError>) -> Void) {
        
        let url = baseUrl + Endpoint.email.path + clientId
        AF.request(url)
          .validate()
          .responseDecodable(of: APIModel.self) { (response) in
           
            switch response.response?.statusCode {
            case 200:
                guard let email = response.value else { return }
                print(email.results?.first?.title! ?? "")
                completionHandler(.success(email))
            
            case .none:
                completionHandler(.failure(.noData))
            
            case .some(_):
                completionHandler(.failure(.noData))
            }
          }
    }
    
    func getSharedList(completionHandler: @escaping (Result<APIModel, CuntomError>) -> Void) {
        
        let url = baseUrl + Endpoint.shared.path + clientId
        AF.request(url)
          .validate()
          .responseDecodable(of: APIModel.self) { (response) in
            
            switch response.response?.statusCode {
            case 200:
                guard let shared = response.value else { return }
                print(shared.results?.first?.title! ?? "")
                completionHandler(.success(shared))
            
            case .none:
                completionHandler(.failure(.noData))
            
            case .some(_):
                completionHandler(.failure(.noData))
            }
          }
    }
    
    func getViewedList(completionHandler: @escaping (Result<APIModel, CuntomError>) -> Void) {
        
        let url = baseUrl + Endpoint.viewed.path + clientId
        AF.request(url)
          .validate()
          .responseDecodable(of: APIModel.self) { (response) in
            
            switch response.response?.statusCode {
            case 200:
                guard let viewed = response.value else { return }
                print(viewed.results?.first?.title! ?? "")
                completionHandler(.success(viewed))
            
            case .none:
                completionHandler(.failure(.noData))
            
            case .some(_):
                completionHandler(.failure(.noData))
            }
          }
    }
}
