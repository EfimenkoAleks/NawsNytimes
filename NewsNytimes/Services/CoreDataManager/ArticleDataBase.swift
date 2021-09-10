//
//  ArticleDataBase.swift
//  NewsNytimes
//
//  Created by user on 09.09.2021.
//

import Foundation
import CoreData

class ArticleDataBase: CoreDataManager {
    
}

extension ArticleDataBase: CoreDataManagerProtocol {
    
    func save(title: String, image: String, abstract: String, completion: @escaping (Result<Bool, Error>) -> ()) {
       
        var isStop = false
        self.fetchAllArticles { (result) in
            switch result {

            case .success(let model):
                model.forEach { (item) in
                    let rez = item.value(forKey: "title") as? String ?? "N/A"
                    if rez == title {
                        isStop = true
                        return
                    }
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        if isStop {
            return
        }
        
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Articl", in: context)!
        let articl = NSManagedObject(entity: entity, insertInto: context)
        
        articl.setValue(image, forKey: "image")
        articl.setValue(title, forKeyPath: "title")
        articl.setValue(abstract, forKeyPath: "abstract")
        
        
        do {
            try context.save()
            completion(.success(true))
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            completion(.failure(error))
        }
    }
    
    func fetchAllArticles( completion: @escaping (Result<[NSManagedObject], Error>) -> ()) {
    
        let context = persistentContainer.viewContext
        let featchRequest = NSFetchRequest<NSManagedObject>(entityName: "Articl")
        
        do {
            let result = try context.fetch(featchRequest)
            completion(.success(result))
        } catch let error as NSError {
            completion(.failure(error))
        }
    }
    
    func deleteArticle(_ article: NSManagedObject, completion: @escaping (Result<Bool, Error>) -> ()) {
       
        let context = persistentContainer.viewContext
        let title = article.value(forKey: "title") as? String
        guard let titleRequest = title else { return }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Articl")
        fetchRequest.predicate = NSPredicate(format: "SELF.title = %@", titleRequest)
        let objects = try! context.fetch(fetchRequest)
        for obj in objects {
            context.delete(obj)
        }

        do {
            try context.save()
            completion(.success(true))
        } catch let error {
            print(error.localizedDescription)
            completion(.failure(error))
        }
    }
}
