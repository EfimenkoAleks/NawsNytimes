//
//  ViewedWireframe.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class ViewedWireFrame {
    
    static func create() -> UIViewController {
        let view = ViewedViewController()
        let router = ViewedRouter()
        router.controller = view
       let viewModel = ViewedViewModel(router: router)
        view.viewModel = viewModel
        
        return view
    }
}
