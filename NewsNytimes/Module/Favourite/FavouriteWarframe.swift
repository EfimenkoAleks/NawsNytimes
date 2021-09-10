//
//  FavouriteWarframe.swift
//  NewsNytimes
//
//  Created by user on 09.09.2021.
//

import UIKit

class FavouriteWarframe {
    
    static func create() -> UIViewController {
        let view = FavouriteViewController()
        let router = FavouriteRouter()
        router.controller = view
        let viewModel = FavouriteViewModel(router: router)
        view.viewModel = viewModel
        
        return view
    }
}
