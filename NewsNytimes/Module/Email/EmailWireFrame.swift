//
//  EmailWireFrame.swift
//  NewsNytimes
//
//  Created by user on 08.09.2021.
//

import UIKit

class EmailWireFrame {
    
    public struct EmailModule {
        let view: UIViewController
        let viewModel: EmailViewModel
        let router: EmailRouter
    }
    
    static func create(context: UIViewController) -> EmailModule {
        let view = EmailViewController()
        let router = EmailRouter()
        router.controller = context
        let viewModel = EmailViewModel(router: router)
        view.viewModel = viewModel
        
        return EmailModule(view: view, viewModel: viewModel, router: router)
    }
}
