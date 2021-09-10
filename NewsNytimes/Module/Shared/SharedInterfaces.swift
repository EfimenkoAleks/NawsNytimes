//
//  SharedInterfaces.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import Foundation

protocol SharedViewModelOutputProtocol: class {
    var countEmails: Int { get }
    func itemForTable(index: Int) -> Articles
    func goToDetail(index: Int)
}

protocol SharedViewModelInputProtocol: class {
    func addToFavourites(id: Double)
}

protocol SharedViewModelProtocol: SharedViewModelOutputProtocol, SharedViewModelInputProtocol {}

protocol SharedRouterProtocol: class {
    func goToDetail(model: DetailModel)
}

protocol SharedViewModelDelegate: class {
    func didFetchData()
}
