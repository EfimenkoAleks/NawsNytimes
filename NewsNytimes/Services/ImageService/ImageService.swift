//
//  ImageService.swift
//  NewsNytimes
//
//  Created by user on 10.09.2021.
//

import Foundation
import Alamofire

protocol ImageService {
    func loadPhoto(url: String, completion: @escaping (Data?) -> ())
}

class ImageServiceImplementation {
    
    var imageCache = NSCache<NSString, NSData>()
}

extension ImageServiceImplementation: ImageService {
    
    func loadPhoto(url: String, completion: @escaping (Data?) -> ()) {
        
        if let cachedData = self.imageCache.object(forKey: url as NSString) {
            completion(cachedData as Data)
        }
        
    AF.request( url,method: .get).response{ response in

       switch response.result {
        case .success(let responseData):
            completion(responseData)
        case .failure(let error):
            print("error--->",error)
        }
    }
    }
}
