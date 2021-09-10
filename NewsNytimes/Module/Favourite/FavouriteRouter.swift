//
//  FavouriteRouter.swift
//  NewsNytimes
//
//  Created by user on 09.09.2021.
//

import UIKit

class FavouriteRouter {
    weak var controller: UIViewController?
    
}

extension FavouriteRouter: FavouriteRouterProtocol {
    func goToDetail(model: DetailModel) {
        let view = DetailWireframe.create(model: model)
        self.controller?.navigationController?.pushViewController(view, animated: true)
    }
}
