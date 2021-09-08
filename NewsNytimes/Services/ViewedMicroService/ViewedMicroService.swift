//
//  ViewedMicroService.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

protocol ViewedMicroService: Service {
    var viewedList: [MostEmailedList] { get }
}

class ViewedMicroServiceImplementation {
    
    private let apiService: APIService
    var state: ServiceState = .initial
    private(set) var viewedList = [MostEmailedList]()
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    private func load(completionHandler: @escaping (ServiceState) -> Void) {
        guard self.state != .loading else { return }
        self.viewedList = []
        self.state = .loading
//        completionHandler(self.state)
        self.apiService
            .getViewedList { [weak self] (result) in
                guard let self = self else {
                    completionHandler(.error)
                    return
                }
                guard let list = try? result.get() else {
                    self.state = .error
                    completionHandler(self.state)
                    return
                }
                
                self.viewedList = list
                
                self.state = .loaded
                completionHandler(self.state)
            }
    }
}

extension ViewedMicroServiceImplementation: ViewedMicroService {
    
    func reload(completionHandler: @escaping (ServiceState) -> Void) {
        self.load(completionHandler: completionHandler)
    }
}
