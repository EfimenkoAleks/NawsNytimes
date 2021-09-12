//
//  ConfigurationService.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

protocol ConfigurationService: Service {}

class ConfigurationServiceImplementation {
    private(set) var state: ServiceState = .initial
    private let emailedService: EmailMicroService
    private let sharedService: SharedMicroService
    private let viewedService: ViewedMicroService
    
    init(
        emailedService: EmailMicroService = DIContainer.default.emailedMicroService,
        sharedService: SharedMicroService = DIContainer.default.sharedMicroService,
        viewedService: ViewedMicroService = DIContainer.default.viewedMicroService
    ) {
        self.emailedService = emailedService
        self.sharedService = sharedService
        self.viewedService = viewedService
    }
    
    fileprivate func loadServices(completionHandler: @escaping () -> Void) {
        
        self.state = .loading
        
        let services = [self.emailedService, self.sharedService, self.viewedService]
    
        let group = DispatchGroup()
        
        services
            .forEach({
                group.enter()
                $0.reload { (state) in
                    if state == .loaded {
                        self.state = .loaded
                        group.leave()
                    } else {
                        self.state = .error
                        group.leave()
                    }
                }
            })
        
        group.notify(queue: .main) {
            completionHandler()
        }
    }
}

extension ConfigurationServiceImplementation: ConfigurationService {

    func reload(completionHandler: @escaping (ServiceState) -> Void) {
        self.loadServices { [unowned self] in
            completionHandler(self.state)
        }
    }
}
