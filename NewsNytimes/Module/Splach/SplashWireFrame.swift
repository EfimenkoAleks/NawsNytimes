//
//  SplashWireFrame.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import UIKit

class SplashWireFrame {
    
    static func create() -> UIViewController {
        let view = SplashViewController()
        let router = SplashRouter()
        router.controller = view
        let viewModel = SplashViewModel(router: router)
        view.viewModel = viewModel
        
        return view
    }
}

