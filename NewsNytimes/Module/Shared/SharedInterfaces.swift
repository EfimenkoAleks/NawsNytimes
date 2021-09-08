//
//  SharedInterfaces.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import Foundation

protocol SharedViewModelOutputProtocol: class {
    var countEmails: Int { get }
    func itemForTable(index: Int) -> Emailed
}

protocol SharedViewModelInputProtocol: class {}

protocol SharedViewModelProtocol: SharedViewModelOutputProtocol, SharedViewModelInputProtocol {}

protocol SharedRouterProtocol: class {}

protocol SharedViewModelDelegate: class {
    func didFetchData()
}