//
//  EmailViewModel.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import Foundation

class EmailViewModel {
    private var router: EmailRouterProtocol
    weak var delegate: EmailViewModelDelegate?
    private var emails: [Emailed]
    private var service: EmailMicroService
    
    init(
        router: EmailRouterProtocol,
         service: EmailMicroService = DIContainer.default.emailedMicroService
         ) {
        self.router = router
        self.emails = []
        self.service = service
        if self.service.emailList.count > 0 {
            self.emails = self.service.emailList
            self.delegate?.didFetchData()
        }
    }
}

extension EmailViewModel: EmailViewModelProtocol {
    
    var countEmails: Int {
        return self.emails.count
    }
    
    func itemForTable(index: Int) -> Emailed {
        return self.emails[index]
    }
}
