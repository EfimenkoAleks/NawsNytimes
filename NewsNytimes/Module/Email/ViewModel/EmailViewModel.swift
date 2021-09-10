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
    private var emails: [Articles]
    private var service: EmailMicroService
    private var dataSource: CoreDataManagerProtocol
    
    init(
        router: EmailRouterProtocol,
         service: EmailMicroService = DIContainer.default.emailedMicroService,
        dataService: CoreDataManagerProtocol = DIContainer.default.coreDataArticles
         ) {
        self.router = router
        self.emails = []
        self.service = service
        self.dataSource = dataService
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
    
    func itemForTable(index: Int) -> Articles {
        return self.emails[index]
    }
    
    func addToFavourites(id: Double) {
        let model = self.emails.first(where: {$0.id == id})
        guard let title = model?.title, let url = model?.media?.last?.mediaMetadata?.last?.url, let abstract = model?.abstract else { return }
        
        self.dataSource.save(title: title, image: url, abstract: abstract) { (result) in
            switch result {
            case .success(_):
                print("success")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
