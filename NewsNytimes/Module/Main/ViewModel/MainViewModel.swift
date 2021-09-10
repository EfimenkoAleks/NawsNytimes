//
//  MainViewModel.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit

class MainViewModel {
    private var router: MainRouterProtocol
    weak var delegate: MainViewModelDelegate?
    
    init(router: MainRouterProtocol) {
        self.router = router
    }
}

extension MainViewModel: MainViewModelProtocol {
    
    func routeToFavourite() {
        self.router.goToFavourite()
    }
    
}
