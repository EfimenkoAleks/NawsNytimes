//
//  MainViewModel.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit

class MainViewModel {
    private var router: MainRouterProtocol
    private var titles: [String]
    private var images: [UIImage]
    
    init(router: MainRouterProtocol) {
        
        self.router = router
        self.titles = ["email", "shared", "viewed"]
        self.images = []
        
        let email = UIImage(systemName: "envelope")?.withRenderingMode(.alwaysTemplate)
        let shared = UIImage(systemName: "square.and.arrow.up")?.withRenderingMode(.alwaysTemplate)
        let viewed = UIImage(systemName: "book")?.withRenderingMode(.alwaysTemplate)
        guard let emailImage = email, let sharedImage = shared, let viewedImage = viewed else { return }
        self.images = [emailImage, sharedImage, viewedImage]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image:UIImage) ->UIViewController {
        
        rootViewController.tabBarItem.title = title
        rootViewController.tabBarItem.image = image
        
        return rootViewController
    }
}

extension MainViewModel: MainViewModelProtocol {
    
    func routeToFavourite() {
        self.router.goToFavourite()
    }
    
    func createTabBarController() -> [UIViewController] {
        
        let controllers: [UIViewController] = [self.router.emailModule.view, self.router.sharedModule.view, self.router.viewedModule.view]
        
        var viewControllers: [UIViewController] = []
        for (i, item) in controllers.enumerated() {
            
            viewControllers.append(self.generateNavigationController(rootViewController: item, title: self.titles[i], image: self.images[i]))
        }
        return viewControllers
    }
}
