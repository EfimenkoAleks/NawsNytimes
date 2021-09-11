//
//  MainIntemfaces.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit

protocol MainViewModelOutputProtocol: class {
    func createTabBarController() -> [UIViewController]
}

protocol MainViewModelInputProtocol: class {
    func routeToFavourite()
}

protocol MainViewModelProtocol: MainViewModelOutputProtocol, MainViewModelInputProtocol {}

protocol MainRouterProtocol: class {
    
    var emailModule: EmailWireFrame.EmailModule { get }
    var sharedModule: SharedWireFrame.SharedModule { get }
    var viewedModule: ViewedWireframe.ViewedModule { get }
    func goToFavourite()
}
