//
//  DetailWireframe.swift
//  NewsNytimes
//
//  Created by user on 10.09.2021.
//

import UIKit

class DetailWireframe {
    
    static func create(model: DetailModel) -> UIViewController {
        let view = DetailViewController()
        let viewModel = DetailViewModel(model: model)
        view.viewModel = viewModel
        
        return view
    }
}
