//
//  MainViewController.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class MainViewController: UITabBarController {
    
    var viewModel: MainViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray5
        self.createFavorites()
        self.setViewControllers(self.createTabBarController(), animated: true)
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image:UIImage) ->UIViewController {

        rootViewController.tabBarItem.title = title
        rootViewController.tabBarItem.image = image

        return rootViewController
    }
  
    private func createTabBarController() -> [UIViewController] {
        let view1 = EmailWireFrame.create(context: self)
        let view2 = SharedWireFrame.create(context: self)
        let view3 = ViewedWireframe.create(context: self)
        let controllers: [UIViewController] = [view1.view, view2.view, view3.view]
        
        let email = UIImage(systemName: "envelope")?.withRenderingMode(.alwaysTemplate)
        let shared = UIImage(systemName: "square.and.arrow.up")?.withRenderingMode(.alwaysTemplate)
        let viewed = UIImage(systemName: "book")?.withRenderingMode(.alwaysTemplate)
        guard let emailImage = email, let sharedImage = shared, let viewedImage = viewed else { return [] }
        let images = [emailImage, sharedImage, viewedImage]
        let titles = ["email", "shared", "viewed"]
        
        var viewControllers: [UIViewController] = []
        for (i, item) in controllers.enumerated() {
            
            viewControllers.append(self.generateNavigationController(rootViewController: item, title: titles[i], image: images[i]))
        }
        return viewControllers
    }
    
    private func createFavorites() {
        
        let imageStar = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        let star = UIBarButtonItem(image: imageStar, style: .plain, target: self, action: #selector(MainViewController.goFavorites))
        UITabBar.appearance().tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        star.tintColor = .black
      
        navigationItem.rightBarButtonItem = star
    }
    
    @objc func goFavorites() {
        self.viewModel.routeToFavourite()
    }
}
