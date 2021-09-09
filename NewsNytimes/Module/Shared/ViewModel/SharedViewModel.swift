//
//  SharedViewModel.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import Foundation

class SharedViewModel {
    private var router: SharedRouterProtocol
    weak var delegate: SharedViewModelDelegate?
    private var emails: [Articles]
    private var service: SharedMicroService
    
    init(
        router: SharedRouterProtocol,
        service: SharedMicroService = DIContainer.default.sharedMicroService
         ) {
        self.router = router
        self.emails = []
        self.service = service
        if self.service.sharedList.count > 0 {
            self.emails = self.service.sharedList
            self.delegate?.didFetchData()
        }
    }
}

extension SharedViewModel: SharedViewModelProtocol {
    
    var countEmails: Int {
        return self.emails.count
    }
    
    func itemForTable(index: Int) -> Articles {
        return self.emails[index]
    }
}

