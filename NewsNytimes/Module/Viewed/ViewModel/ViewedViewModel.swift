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
    private var dataSource: CoreDataManagerProtocol
    
    init(
        router: ViewedRouterProtocol,
        service: ViewedMicroService = DIContainer.default.viewedMicroService,
        dataService: CoreDataManagerProtocol = DIContainer.default.coreDataArticles
         ) {
        self.router = router
        self.emails = []
        self.service = service
        self.dataSource = dataService
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


