//
//  SharedWireFrame.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class SharedWireFrame {
    
    static func create() -> UIViewController {
        let view = SharedViewController()
        let router = SharedRouter()
        router.controller = view
       let viewModel = SharedViewModel(router: router)
        view.viewModel = viewModel
        
        return view
    }
}
