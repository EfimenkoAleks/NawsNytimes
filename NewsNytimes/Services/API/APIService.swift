//
//  APIService.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

protocol APIService {
    
    func getEmialedList(
        completionHandler: @escaping (Result<MostEmailedList, Error>) -> Void
    )
    
    func getSharedList(
        completionHandler: @escaping (Result<MostEmailedList, Error>) -> Void
    )
    
    func getViewedList(
        completionHandler: @escaping (Result<MostEmailedList, Error>) -> Void
    )
}
