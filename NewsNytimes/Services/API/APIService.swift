//
//  APIService.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

protocol APIService {
    
    func getEmialedList(
        completionHandler: @escaping (Result<APIModel, CuntomError>) -> Void
    )
    
    func getSharedList(
        completionHandler: @escaping (Result<APIModel, CuntomError>) -> Void
    )
    
    func getViewedList(
        completionHandler: @escaping (Result<APIModel, CuntomError>) -> Void
    )
}
