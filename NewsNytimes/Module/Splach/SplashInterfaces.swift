//
//  SplashInterfaces.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

protocol SplashViewModelOutputProtocol: class {
    var delegate: SplashViewModelDelegate? { get set }
}

protocol SplashViewModelInputProtocol: class {
    func goToMain()
}

protocol SplashViewModelProtocol: SplashViewModelOutputProtocol, SplashViewModelInputProtocol {}

protocol SplashRouterProtocol: class {
    func goToMain()
}

protocol SplashViewModelDelegate: class {
    func appStart()
    func appError()
}
