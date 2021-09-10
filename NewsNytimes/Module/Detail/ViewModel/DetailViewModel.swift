//
//  DetailViewModel.swift
//  NewsNytimes
//
//  Created by user on 10.09.2021.
//

import Foundation

enum ArticleDetail {
    case title(String?)
    case text(String?)
    case image(Data)
}

class DetailViewModel {
    weak var delegate: DetailViewModelDelegate?
    private var dataSource: [ArticleDetail] = []
    private var service: ImageService
    private var detailModel: DetailModel
    
    init(
        model: DetailModel,
         service: ImageService = DIContainer.default.imageService
         ) {
        self.detailModel = model
        self.service = service
        
        self.featchData()
    }
    
    private func featchData() {
        self.service.loadPhoto(url: self.detailModel.image) { [weak self] (data) in
            guard let self = self else { return }
            self.dataSource.append(.title(self.detailModel.title))
            self.dataSource.append(.text(self.detailModel.abstract))
            guard let data = data else { return }
            self.dataSource.append(.image(data))
            
            self.delegate?.didFetchData()
        }
    }
}

extension DetailViewModel: DetailViewModelProtocol {
    var numberOfItems: Int {
        return self.dataSource.count
    }
    
    func item(by index: Int) -> ArticleDetail? {
        guard index < self.dataSource.count else {
            return nil
        }
        return self.dataSource[index]
    }
}
