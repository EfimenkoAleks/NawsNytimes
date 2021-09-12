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

        self.viewModel.delegate = self
        self.view.backgroundColor = .systemGray5
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
    
    private func showAlert() {
        let alert = UIAlertController(title: "Allert", message: "Something went wrong, please try again later.", preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                self.present(alert, animated: true, completion: nil)
    }
}

extension SplashViewController: SplashViewModelDelegate {
    
    func appError() {
        self.loadIndikator.stopAnimating()
        self.showAlert()
    }
    
    func appStart() {
        self.loadIndikator.stopAnimating()
        self.viewModel.goToMain()
    }
}
