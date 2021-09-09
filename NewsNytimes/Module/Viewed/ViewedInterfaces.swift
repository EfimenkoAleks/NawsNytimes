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
}

protocol ViewedViewModelInputProtocol: class {}

protocol ViewedViewModelProtocol: ViewedViewModelOutputProtocol, ViewedViewModelInputProtocol {}

protocol ViewedRouterProtocol: class {}

protocol ViewedViewModelDelegate: class {
    func didFetchData()
}
