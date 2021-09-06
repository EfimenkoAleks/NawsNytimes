//
//  MainWireFrame.swift
//  NewsNytimes
//
//  Created by user on 06.09.2021.
//

import UIKit

class MainWireFrame {
    
    static func create() -> UIViewController {
        let view = MainViewController()
        let router = MainRouter()
        router.controller = view
        let viewModel = MainViewModel(router: router)
        view.viewModel = viewModel
        
        return view
    }
}
