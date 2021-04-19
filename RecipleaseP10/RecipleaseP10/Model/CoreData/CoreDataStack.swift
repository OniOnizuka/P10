//
//  CoreDataStack.swift
//  RecipleaseP10
//
//  Created by Alexandre NYS on 16/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.


import Foundation
import CoreData

// An object that will manage the core data stack and saving support
class CoreDataStack {
    
    // MARK: - Properties
    private let modelName: String
    
    // MARK: - Initializer
    init(modelName: String) {
          self.modelName = modelName
      }
    
    // MARK: - Core Data Stack
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print(error.userInfo)
            }
        })
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        guard viewContext.hasChanges else { return }
        
        do {
            try viewContext.save()
        } catch let nserror as NSError {
            print(nserror.userInfo)
        }
    }
}
