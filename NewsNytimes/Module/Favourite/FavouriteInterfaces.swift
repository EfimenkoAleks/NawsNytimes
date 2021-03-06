//
//  FavouriteInterfaces.swift
//  NewsNytimes
//
//  Created by user on 09.09.2021.
//

import Foundation
import CoreData

protocol FavouriteViewModelOutputProtocol: class {
    var countFavourites: Int { get }
    func itemForTable(index: Int) -> NSManagedObject
    var delegate: FavouriteViewModelDelegate? { get set }
}

protocol FavouriteViewModelInputProtocol: class {
    func deleteFauvorite(index: Int)
    func goToDetail(index: Int)
}

protocol FavouriteViewModelProtocol: FavouriteViewModelOutputProtocol, FavouriteViewModelInputProtocol {}

protocol FavouriteRouterProtocol: class {
    func goToDetail(model: DetailModel)
}

protocol FavouriteViewModelDelegate: class {
    func didFetchData()
}
