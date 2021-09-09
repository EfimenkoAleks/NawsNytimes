//
//  ViewedViewModel.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import Foundation

class ViewedViewModel {
    private var router: ViewedRouterProtocol
    weak var delegate: ViewedViewModelDelegate?
    private var emails: [Articles]
    private var service: ViewedMicroService
    
    init(
        router: ViewedRouterProtocol,
        service: ViewedMicroService = DIContainer.default.viewedMicroService
         ) {
        self.router = router
        self.emails = []
        self.service = service
        if self.service.viewedList.count > 0 {
            self.emails = self.service.viewedList
            self.delegate?.didFetchData()
        }
    }
}

extension ViewedViewModel: ViewedViewModelProtocol {
    
    var countEmails: Int {
        return self.emails.count
    }
    
    func itemForTable(index: Int) -> Articles {
        return self.emails[index]
    }
}


