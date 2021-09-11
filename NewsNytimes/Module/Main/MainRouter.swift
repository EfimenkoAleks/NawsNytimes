//
//  MainRouter.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit

class MainRouter {
    weak var controller: UIViewController?
    private(set) var emailModule: EmailWireFrame.EmailModule
    private(set) var sharedModule: SharedWireFrame.SharedModule
    private(set) var viewedModule: ViewedWireframe.ViewedModule
    
    init(context: UIViewController) {
        self.controller = context
        self.emailModule = EmailWireFrame.create(context: context)
        self.sharedModule = SharedWireFrame.create(context: context)
        self.viewedModule = ViewedWireframe.create(context: context)
    }
}

extension MainRouter: MainRouterProtocol {
    func goToFavourite() {
        let view = FavouriteWarframe.create()
        self.controller?.navigationController?.pushViewController(view, animated: true)
    }
}
