//
//  DataSource.swift
//  MVVM Boilerplate
//
//  Created by Lucas Menendez on 9/10/21.
//

import Foundation
import CoreData

let defaultDatabase = "DB"

class DataSource {
    static let shared = DataSource()
    public let container: NSPersistentContainer
    public let viewContext: NSManagedObjectContext
    
    init(dbName: String = defaultDatabase) {
        container = NSPersistentContainer(name: dbName)
        container.loadPersistentStores { (_, err) in
            if let error = err as NSError? {
                print("NSError \(error) - \(error.userInfo)")
                return
            }
        }
        
        viewContext = container.viewContext
    }
    
    func saveContext() {
        do {
            print("Saving context")
            try viewContext.save()
            print("Successfully saved context")
        } catch {
            print("ERROR: \(error as NSObject)")
        }
    }
}
