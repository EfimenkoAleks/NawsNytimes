//
//  APIService.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

protocol APIService {
    
    func getEmialedList(
        completionHandler: @escaping (APIModel) -> Void
    )
    
    func getSharedList(
        completionHandler: @escaping (APIModel) -> Void
    )
    
    func getViewedList(
        completionHandler: @escaping (APIModel) -> Void
    )
}
