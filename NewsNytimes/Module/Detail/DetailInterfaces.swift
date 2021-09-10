//
//  DetailInterfaces.swift
//  NewsNytimes
//
//  Created by user on 10.09.2021.
//

import Foundation
import CoreData

protocol DetailViewModelOutputProtocol: class {
    var numberOfItems: Int { get }
    func item(by index: Int) -> ArticleDetail?
    var delegate: DetailViewModelDelegate? { get set }
}

protocol DetailViewModelInputProtocol: class {}

protocol DetailViewModelProtocol: DetailViewModelOutputProtocol, DetailViewModelInputProtocol {}

protocol DetailViewModelDelegate: class {
    func didFetchData()
}

