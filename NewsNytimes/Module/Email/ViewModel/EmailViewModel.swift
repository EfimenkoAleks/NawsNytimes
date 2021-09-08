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
    
    init(router: EmailRouterProtocol) {
        self.router = router
        self.emails = []
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
