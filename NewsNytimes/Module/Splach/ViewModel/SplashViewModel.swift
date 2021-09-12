//
//  SplashViewModel.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

class SplashViewModel {
    private var router: SplashRouterProtocol
    private var configurationService: ConfigurationService
    weak var delegate: SplashViewModelDelegate?
    
    init(router: SplashRouterProtocol,
         service: ConfigurationService = DIContainer.default.configurationService
         ) {
        self.router = router
        self.configurationService = service
        
        service.reload { (state) in
            if state == .loaded {
                self.delegate?.appStart()
            } else {
                self.delegate?.appError()
            }
        }
    }
}

extension SplashViewModel: SplashViewModelProtocol {
    func goToMain() {
        self.router.goToMain()
    }
}
