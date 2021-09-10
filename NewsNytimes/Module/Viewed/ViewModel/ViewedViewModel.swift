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
    private var vieweds: [Articles]
    private var service: ViewedMicroService
    private var dataSource: CoreDataManagerProtocol
    
    init(
        router: ViewedRouterProtocol,
        service: ViewedMicroService = DIContainer.default.viewedMicroService,
        dataService: CoreDataManagerProtocol = DIContainer.default.coreDataArticles
         ) {
        self.router = router
        self.vieweds = []
        self.service = service
        self.dataSource = dataService
        if self.service.viewedList.count > 0 {
            self.vieweds = self.service.viewedList
            self.delegate?.didFetchData()
        }
    }
}

extension ViewedViewModel: ViewedViewModelProtocol {
    
    var countEmails: Int {
        return self.vieweds.count
    }
    
    func itemForTable(index: Int) -> Articles {
        return self.vieweds[index]
    }
    
    func addToFavourites(id: Double) {
        let model = self.vieweds.first(where: {$0.id == id})
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
    
    func goToDetail(index: Int) {
      
        let title = self.vieweds[index].title ?? "No title"
        let text = self.vieweds[index].abstract ?? "No text"
        let image = self.vieweds[index].media?.last?.mediaMetadata?.last?.url ?? "No image"
        
        let detailModel = DetailModel(title: title, abstract: text, image: image)
        
        self.router.goToDetail(model: detailModel)
    }
}


