//
//  TestCoreDataStack.swift
//  RecipleaseP10Tests
//
//  Created by Alexandre NYS on 15/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.

import XCTest
@testable import RecipleaseP10
import CoreData

// A class that inherits from CoreDataStack that will serve within our tests
class TestCoreDataStack: CoreDataStack {

    override init() {
        super.init()
        
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        
        let container = NSPersistentContainer(name: CoreDataStack.modelName)
        
        container.persistentStoreDescriptions = [persistentStoreDescription]
        
        container.loadPersistentStores {_, error in
            if let error = error as NSError? {
                fatalError("\(error)")
            }
        }
        persistentContainer = container
    }
}
