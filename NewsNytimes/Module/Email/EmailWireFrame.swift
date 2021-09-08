//
//  EmailWireFrame.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class EmailWireFrame {
    
    static func create() -> UIViewController {
        let view = EmailViewController()
        let router = EmailRouter()
        router.controller = view
        let viewModel = EmailViewModel(router: router)
        view.viewModel = viewModel
        
        return view
    }
}
