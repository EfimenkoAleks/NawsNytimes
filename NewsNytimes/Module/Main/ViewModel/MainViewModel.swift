//
//  MainViewModel.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import Foundation

class MainViewModel {
    private var router: MainRouterProtocol
    
    init(router: MainRouterProtocol) {
        self.router = router
    }
}

extension MainViewModel: MainViewModelProtocol {
    
}
