//
//  SplashRouter.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import UIKit

class SplashRouter {
    weak var controller: UIViewController?
}

extension SplashRouter: SplashRouterProtocol {
    func goToMain() {
        let main = MainWireFrame.create()
//        self.controller?.navigationController?.isNavigationBarHidden = true
        self.controller?.navigationController?.setViewControllers([main], animated: true)
    }
}
