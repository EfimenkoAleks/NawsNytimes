//
//  MainIntemfaces.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit

protocol MainViewModelOutputProtocol: class {
    var delegate: MainViewModelDelegate? { get set }
}

protocol MainViewModelInputProtocol: class {
    func routeToFavourite()
}

protocol MainViewModelProtocol: MainViewModelOutputProtocol, MainViewModelInputProtocol {}

protocol MainRouterProtocol: class {
    func goToFavourite()
}

protocol MainViewModelDelegate: class {
    func didFetchData()
}
