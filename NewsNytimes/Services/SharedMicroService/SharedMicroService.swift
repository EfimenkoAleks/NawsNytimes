//
//  SharedMicroService.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

protocol SharedMicroService: Service {
    var sharedList: [Emailed] { get }
}

class SharedMicroServiceImplementation {
    
    private let apiService: APIService
    var state: ServiceState = .initial
    private(set) var sharedList = [Emailed]()
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    private func load(completionHandler: @escaping (ServiceState) -> Void) {
        guard self.state != .loading else { return }
        self.sharedList = []
        self.state = .loading
//        completionHandler(self.state)
        self.apiService
            .getSharedList { [weak self] (result) in
                guard let self = self else {
                    completionHandler(.error)
                    return
                }
                guard let list = try? result.get(), let rezultList = list.results else {
                    self.state = .error
                    completionHandler(self.state)
                    return
                }
                
                self.sharedList = rezultList
                
                self.state = .loaded
                completionHandler(self.state)
            }
    }
}

extension SharedMicroServiceImplementation: SharedMicroService {
    
    func reload(completionHandler: @escaping (ServiceState) -> Void) {
        self.load(completionHandler: completionHandler)
    }
}
