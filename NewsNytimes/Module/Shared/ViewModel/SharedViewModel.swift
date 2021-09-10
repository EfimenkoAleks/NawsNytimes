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
    private var shared: [Articles]
    private var service: SharedMicroService
    private var dataSource: CoreDataManagerProtocol
    
    init(
        router: SharedRouterProtocol,
        service: SharedMicroService = DIContainer.default.sharedMicroService,
        dataService: CoreDataManagerProtocol = DIContainer.default.coreDataArticles
         ) {
        self.router = router
        self.shared = []
        self.service = service
        self.dataSource = dataService
        if self.service.sharedList.count > 0 {
            self.shared = self.service.sharedList
            self.delegate?.didFetchData()
        }
    }
}

extension SharedViewModel: SharedViewModelProtocol {
    
    var countEmails: Int {
        return self.shared.count
    }
    
    func itemForTable(index: Int) -> Articles {
        return self.shared[index]
    }
    
    func addToFavourites(id: Double) {
        let model = self.shared.first(where: {$0.id == id})
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
      
        let title = self.shared[index].title ?? "No title"
        let text = self.shared[index].abstract ?? "No text"
        let image = self.shared[index].media?.last?.mediaMetadata?.last?.url ?? "No image"
        
        let detailModel = DetailModel(title: title, abstract: text, image: image)
        
        self.router.goToDetail(model: detailModel)
    }
}

