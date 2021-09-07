//
//  MainIntemfaces.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import Foundation

protocol MainViewModelOutputProtocol: class {
    var countArticles: Int { get }
    func itemForTable(index: Int) -> String
}

protocol MainViewModelInputProtocol: class {}

protocol MainViewModelProtocol: MainViewModelOutputProtocol, MainViewModelInputProtocol {}

protocol MainRouterProtocol: class {}

protocol MainViewModelDelegate: class {
    func didFetchData()
}
