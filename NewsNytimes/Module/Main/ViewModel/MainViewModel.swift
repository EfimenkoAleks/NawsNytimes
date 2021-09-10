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
    private var titlesIn: [String]
    private var imagesIn: [UIImage]
    
    init(router: MainRouterProtocol) {
        self.router = router
        self.titlesIn = ["email", "shared", "viewed"]
        self.imagesIn = [UIImage()]
        
        let email = UIImage(systemName: "car")?.withRenderingMode(.alwaysTemplate)
        let shared = UIImage(systemName: "car")?.withRenderingMode(.alwaysTemplate)
        let viewed = UIImage(systemName: "car")?.withRenderingMode(.alwaysTemplate)
        guard let emailImage = email, let sharedImage = shared, let viewedImage = viewed else { return }
        self.imagesIn = [emailImage, sharedImage, viewedImage]
        
//        self.delegate?.didFetchData()
    }
}

extension MainViewModel: MainViewModelProtocol {
    
    var modules: [UIViewController] {
        [
            self.router.emailModule.view,
            self.router.sharedModule.view,
            self.router.viewedModule.view
        ]
    }
    
    var titles: [String] {
       return self.titlesIn
    }
    
    var images: [UIImage] {
        return self.imagesIn
    }
    
    func routeToFavourite() {
        self.router.goToFavourite()
    }
    
}
