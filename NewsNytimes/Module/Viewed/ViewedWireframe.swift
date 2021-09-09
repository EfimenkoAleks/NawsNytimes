//
//  ViewedWireframe.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class ViewedWireframe {
    
    public struct ViewedModule {
        let view: UIViewController
        let viewModel: ViewedViewModel
        let router: ViewedRouter
    }
    
    static func create(context: UIViewController) -> ViewedModule {
        let view = ViewedViewController()
        let router = ViewedRouter()
        router.controller = context
        let viewModel = ViewedViewModel(router: router)
        view.viewModel = viewModel
        
        return ViewedModule(view: view, viewModel: viewModel, router: router)
    }
}
