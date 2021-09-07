//
//  MainViewModel.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import Foundation

class MainViewModel {
    private var router: MainRouterProtocol
    weak var delegate: MainViewModelDelegate?
    private var articles: [String]
    
    init(router: MainRouterProtocol) {
        self.router = router
        self.articles = []
    }
}

extension MainViewModel: MainViewModelProtocol {
    
    var countArticles: Int {
        return self.articles.count
    }
    
    func itemForTable(index: Int) -> String {
        return self.articles[index]
    }
}
