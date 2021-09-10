//
//  DIContainer.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

import Foundation

struct DIContainer {

    static var `default` = Self()
    
    lazy var apiService: APIService = APIServiceImplementation()
    
    lazy var emailedMicroService: EmailMicroService = EmailMicroServiceImplementation(apiService: apiService)
    
    lazy var sharedMicroService: SharedMicroService = SharedMicroServiceImplementation(apiService: self.apiService)
    
    lazy var viewedMicroService: ViewedMicroService = ViewedMicroServiceImplementation(apiService: self.apiService)
    
    lazy var configurationService: ConfigurationService = ConfigurationServiceImplementation(emailedService: self.emailedMicroService, sharedService: self.sharedMicroService, viewedService: self.viewedMicroService)
    
    lazy var coreDataArticles: CoreDataManagerProtocol = ArticleDataBase()
}
