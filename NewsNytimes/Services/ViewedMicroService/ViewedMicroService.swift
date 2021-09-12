//
//  ViewedMicroService.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

protocol ViewedMicroService: Service {
    var viewedList: [Articles] { get }
}

class ViewedMicroServiceImplementation {
    
    private let apiService: APIService
    var state: ServiceState = .initial
    private(set) var viewedList = [Articles]()
    
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
                switch result {
                
                case .success(let data):
                    guard let rezultList = data.results else {
                        self.state = .error
                        completionHandler(self.state)
                        return
                    }
                    
                    self.viewedList = rezultList
                    
                    self.state = .loaded
                    completionHandler(self.state)
                    
                case .failure(let error):
                    if error == .noData {
                        self.state = .error
                        completionHandler(self.state)
                    }
                }
            }
    }
}

extension ViewedMicroServiceImplementation: ViewedMicroService {
    
    func reload(completionHandler: @escaping (ServiceState) -> Void) {
        self.load(completionHandler: completionHandler)
    }
}
