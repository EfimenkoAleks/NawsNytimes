//
//  ViewedRouter.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class ViewedRouter {
    weak var controller: UIViewController?
}

extension ViewedRouter: ViewedRouterProtocol {
    func goToDetail(model: DetailModel) {
        let view = DetailWireframe.create(model: model)
        self.controller?.navigationController?.pushViewController(view, animated: true)
    }
}
