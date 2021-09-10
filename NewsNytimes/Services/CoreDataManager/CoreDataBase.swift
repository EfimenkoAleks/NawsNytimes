//
//  CoreDataBase.swift
//  NewsNytimes
//
//  Created by user on 09.09.2021.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    func save(title: String, image: String, abstract: String, completion: @escaping (Result<Bool, Error>) -> ())
    func fetchAllArticles( completion: @escaping (Result<[NSManagedObject], Error>) -> ())
    func deleteArticle(_ article: NSManagedObject, completion: @escaping (Result<Bool, Error>) -> ())
}

class CoreDataManager {
 
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "NewsNytimes")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
