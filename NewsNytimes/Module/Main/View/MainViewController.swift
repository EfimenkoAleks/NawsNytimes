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
        
        self.view.backgroundColor = .systemOrange
        self.createFavorites()
        self.setViewControllers(self.createTabBarController(), animated: true)
 //       self.viewModel.delegate = self
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image:UIImage) ->UIViewController {

        rootViewController.tabBarItem.title = title
        rootViewController.tabBarItem.image = image

        return rootViewController
    }
    
//    private func createControllers() -> [UIViewController] {
//
//        var viewControllers: [UIViewController] = []
//        for (i, item) in self.viewModel.modules.enumerated() {
//
//            viewControllers.append(self.generateNavigationController(rootViewController: item, title: self.viewModel.titles[i], image: self.viewModel.images[i]))
//        }
//        return viewControllers
//    }
    
    private func createTabBarController() -> [UIViewController] {
        let view1 = EmailWireFrame.create(context: self)
        let view2 = SharedWireFrame.create(context: self)
        let view3 = ViewedWireframe.create(context: self)
        let controllers: [UIViewController] = [view1.view, view2.view, view3.view]
        
        let email = UIImage(systemName: "envelope")?.withRenderingMode(.alwaysTemplate)
        let shared = UIImage(systemName: "square.and.arrow.up")?.withRenderingMode(.alwaysTemplate)
        let viewed = UIImage(systemName: "book")?.withRenderingMode(.alwaysTemplate)
        guard let emailImage = email, let sharedImage = shared, let viewedImage = viewed else { return [] }
        let imagesIn = [emailImage, sharedImage, viewedImage]
        let titlesIn = ["email", "shared", "viewed"]
        
        var viewControllers: [UIViewController] = []
        for (i, item) in controllers.enumerated() {
            
            viewControllers.append(self.generateNavigationController(rootViewController: item, title: titlesIn[i], image: imagesIn[i]))
        }
        return viewControllers
    }
    
    private func createFavorites() {
        
        let imageStar = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        let star = UIBarButtonItem(image: imageStar, style: .plain, target: self, action: #selector(MainViewController.goFavorites))
        UITabBar.appearance().tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        star.tintColor = .black
        
//        self.navigationController?.navigationItem.rightBarButtonItem = star
        navigationItem.rightBarButtonItem = star
    }
    
    @objc func goFavorites() {
        print("goFavorites")
    }
}

//extension MainViewController: MainViewModelDelegate {
//
//    func didFetchData() {
//        self.setViewControllers(self.createControllers(), animated: true)
//    }
//}

extension MainViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

//        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
//        if selectedIndex == 0 {
//            tabBar.items?.first?.selectedImage = UIImage(systemName: "cart.fill")
//        } else {
//            tabBar.items?.last?.selectedImage = UIImage(systemName: "car.fill")
//        }
    }
}
