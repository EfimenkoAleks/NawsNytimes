//
//  MainIntemfaces.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit

protocol MainViewModelOutputProtocol: class {
    var modules: [UIViewController] { get }
    var titles: [String] { get }
    var images: [UIImage] { get }
    var delegate: MainViewModelDelegate? { get set }
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

protocol MainViewModelDelegate: class {
    func didFetchData()
}
