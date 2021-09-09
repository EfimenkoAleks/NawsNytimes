//
//  SharedWireFrame.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class SharedWireFrame {
    
    public struct SharedModule {
        let view: UIViewController
        let viewModel: SharedViewModel
        let router: SharedRouter
    }
    
    static func create(context: UIViewController) -> SharedModule {
        let view = SharedViewController()
        let router = SharedRouter()
        router.controller = context
        let viewModel = SharedViewModel(router: router)
        view.viewModel = viewModel
        
        return SharedModule(view: view, viewModel: viewModel, router: router)
    }
}
