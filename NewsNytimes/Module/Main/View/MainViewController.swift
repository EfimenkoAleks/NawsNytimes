//
//  MainViewController.swift
//  NewsNytimes
//
//  Created by user on 11.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModelProtocol!
    
    @IBOutlet weak var container: UIView!
    
    
    private lazy var tabBar: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(self.viewModel.createTabBarController(), animated: false)
        if let view = tabBarController.view {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.container.addSubview(view)
            
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: self.container.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.container.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.container.trailingAnchor)
            ])
        }
        return tabBarController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createFavorites()
        self.tabBar.selectedIndex = 0
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
