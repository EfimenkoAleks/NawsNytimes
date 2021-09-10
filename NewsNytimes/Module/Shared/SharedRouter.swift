//
//  SharedRouter.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class SharedRouter {
    weak var controller: UIViewController?
}

extension SharedRouter: SharedRouterProtocol {
    func goToDetail(model: DetailModel) {
        let view = DetailWireframe.create(model: model)
        self.controller?.navigationController?.pushViewController(view, animated: true)
    }
}

