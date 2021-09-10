//
//  EmailInterfaces.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import Foundation

protocol EmailViewModelOutputProtocol: class {
    var countEmails: Int { get }
    func itemForTable(index: Int) -> Articles
}

protocol EmailViewModelInputProtocol: class {
    func addToFavourites(id: Double)
    func goToDetail(index: Int)
}

protocol EmailViewModelProtocol: EmailViewModelOutputProtocol, EmailViewModelInputProtocol {}

protocol EmailRouterProtocol: class {
    func goToDetail(model: DetailModel)
}

protocol EmailViewModelDelegate: class {
    func didFetchData()
}

protocol CellButtonDelegate: class {
    func addFavourites(index: Double)
}
