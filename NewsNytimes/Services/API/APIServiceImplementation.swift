//
//  APIServiceImplementation.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation
import Alamofire

class APIServiceImplementation {
    
    let url = "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=E7b7aqpeEq65jjAODAlcGgNEQcakSnFX"
    
}

extension APIServiceImplementation: APIService {
    
    
    func getEmialedList(completionHandler: @escaping (Result<[MostEmailedList], Error>) -> Void) {
        
        AF.request(url)
          .validate()
          .responseDecodable(of: MostEmailedList.self) { (response) in
            guard let films = response.value else { return }
            print(films.results?.first?.title! ?? "")
          }
    }
    
    func getSharedList(completionHandler: @escaping (Result<MostEmailedList, Error>) -> Void) {
        AF.request(url)
          .validate()
          .responseDecodable(of: MostEmailedList.self) { (response) in
            guard let films = response.value else { return }
            print(films.results?.first?.title! ?? "")
          }
    }
    
    func getViewedList(completionHandler: @escaping (Result<[MostEmailedList], Error>) -> Void) {
        AF.request(url)
          .validate()
          .responseDecodable(of: MostEmailedList.self) { (response) in
            guard let films = response.value else { return }
            print(films.results?.first?.title! ?? "")
          }
    }
}
