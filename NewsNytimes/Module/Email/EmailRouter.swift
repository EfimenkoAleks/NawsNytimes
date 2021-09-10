//
//  EmailRouter.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class EmailRouter {
    weak var controller: UIViewController?
}

extension EmailRouter: EmailRouterProtocol {
    func goToDetail(model: DetailModel) {
        let view = DetailWireframe.create(model: model)
        self.controller?.navigationController?.pushViewController(view, animated: true)
    }
}
