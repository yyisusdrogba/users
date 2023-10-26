//
//  CoreDataManager.swift
//  User_List
//
//  Created by Jesus Gonzalez on 26/10/23.
//

import Foundation
import CoreData

class CoreDataManager{
    
    lazy var persistenceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyModelCoreData")
        container.loadPersistentStores { persistenceStore, error in
            if let error = error {
                print(error)
            }
        }
        return container
    }()
    
    func saveContext(){
        let context = persistenceContainer.viewContext
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print(error)
            }
        }
    }
    
    static let shared: CoreDataManager = {
        let instance = CoreDataManager()
        return instance
    }()
    
}
