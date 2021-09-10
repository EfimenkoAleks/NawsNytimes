//
//  ViewedInterfaces.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import Foundation

protocol ViewedViewModelOutputProtocol: class {
    var countEmails: Int { get }
    func itemForTable(index: Int) -> Articles
    func addToFavourites(id: Double)
    func goToDetail(index: Int)
}

protocol ViewedViewModelInputProtocol: class {}

protocol ViewedViewModelProtocol: ViewedViewModelOutputProtocol, ViewedViewModelInputProtocol {}

protocol ViewedRouterProtocol: class {
    func goToDetail(model: DetailModel)
}

protocol ViewedViewModelDelegate: class {
    func didFetchData()
}
