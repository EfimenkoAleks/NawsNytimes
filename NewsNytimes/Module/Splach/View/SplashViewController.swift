//
//  SplashViewController.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import UIKit

class SplashViewController: UIViewController {
    
    var viewModel: SplashViewModelProtocol!
    
    private let loadIndikator : UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView(style: .large)
        ind.backgroundColor = .white
        ind.alpha = 0.3
        ind.translatesAutoresizingMaskIntoConstraints = false
        
        return ind
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue
        self.setupLoadIndikator()
    }
    
    private func setupLoadIndikator() {
        
        self.view.addSubview(loadIndikator)
        
        loadIndikator.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        loadIndikator.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        loadIndikator.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        loadIndikator.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.loadIndikator.startAnimating()
        
    }
}

extension SplashViewController: SplashViewModelDelegate {
    func appStart() {
        self.loadIndikator.stopAnimating()
        self.viewModel.goToMain()
    }
}
