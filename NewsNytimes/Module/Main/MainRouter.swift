//
//  MainRouter.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit

class MainRouter {
    weak var controller: UIViewController?
    
    init(context: UIViewController) {
        self.controller = context
    }
}

extension MainRouter: MainRouterProtocol {
    func goToFavourite() {
        let view = FavouriteWarframe.create()
        self.controller?.navigationController?.pushViewController(view, animated: true)
    }
}
