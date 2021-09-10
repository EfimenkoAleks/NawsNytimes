//
//  FavouriteViewModel.swift
//  NewsNytimes
//
//  Created by user on 09.09.2021.
//

import Foundation
import CoreData

class FavouriteViewModel {
    
    private var router: FavouriteRouterProtocol
    private var dataBase: CoreDataManagerProtocol
    private var tasks: [NSManagedObject]
    weak var delegate: FavouriteViewModelDelegate?
    
    init(
        router: FavouriteRouterProtocol,
         dataBase: CoreDataManagerProtocol = DIContainer.default.coreDataArticles
         ) {
        self.router = router
        self.dataBase = dataBase
        self.tasks = []
        
        self.featch()
    }
    
    private func featch() {
        self.dataBase.fetchAllArticles { (result) in
            switch result {
            
            case .success(let object):
                self.tasks = object
                self.delegate?.didFetchData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension FavouriteViewModel: FavouriteViewModelProtocol {
    var countFavourites: Int {
        return self.tasks.count
    }
    
    func itemForTable(index: Int) -> NSManagedObject {
        return self.tasks[index]
    }
    
    func deleteFauvorite(index: Int) {
        self.dataBase.deleteArticle(self.tasks[index]) { (result) in
            switch result {
            
            case .success(_):
                self.featch()
            case .failure(_):
                print("error failure")
            }
        }
    }
}
