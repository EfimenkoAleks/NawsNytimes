//
//  EmailMicroService.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

protocol EmailMicroService: Service {
    var emailList: [Articles] { get }
}

class EmailMicroServiceImplementation {
    
    private let apiService: APIService
    var state: ServiceState = .initial
    private(set) var emailList = [Articles]()
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    private func load(completionHandler: @escaping (ServiceState) -> Void) {
        guard self.state != .loading else { return }
        self.emailList = []
        self.state = .loading
 //       completionHandler(self.state)
        self.apiService
            .getEmialedList { [weak self] (result) in
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
                    
                    self.emailList = rezultList
                    
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

extension EmailMicroServiceImplementation: EmailMicroService {
    
    func reload(completionHandler: @escaping (ServiceState) -> Void) {
        self.load(completionHandler: completionHandler)
    }
}
