//
//  EmailMicroService.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

protocol EmailMicroService: Service {
    var emailList: [MostEmailedList] { get }
}

class EmailMicroServiceImplementation {
    
    private let apiService: APIService
    var state: ServiceState = .initial
    private(set) var emailList = [MostEmailedList]()
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    private func load(completionHandler: @escaping (ServiceState) -> Void) {
        guard self.state != .loading else { return }
        self.emailList = []
        self.state = .loading
        completionHandler(self.state)
        self.apiService
            .getEmialedList { [weak self] (result) in
                guard let self = self else {
                    completionHandler(.error)
                    return
                }
                guard let list = try? result.get() else {
                    self.state = .error
                    completionHandler(self.state)
                    return
                }
                
                self.emailList = list
                
                self.state = .loaded
                completionHandler(self.state)
            }
    }
}

extension EmailMicroServiceImplementation: EmailMicroService {
    
    func reload(completionHandler: @escaping (ServiceState) -> Void) {
        self.load(completionHandler: completionHandler)
    }
}
