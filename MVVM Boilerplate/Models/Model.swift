//
//  Model.swift
//  MVVM Boilerplate
//
//  Created by Lucas Menendez on 9/10/21.
//

import Combine
import CoreData
import os

class Model<T: Entity>: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
    var records = CurrentValueSubject<[T.CurrentEntity], Never>([])
    private let controller: NSFetchedResultsController<T.CurrentEntity>
    
    override init() {
        controller = NSFetchedResultsController(
            fetchRequest: T.fetchRequest(),
            managedObjectContext: DataSource.shared.viewContext,
            sectionNameKeyPath: nil, cacheName: nil
        )
        
        super.init()
        
        controller.delegate = self
        
        do {
            try controller.performFetch()
            records.value = (controller.fetchedObjects ?? []) as [T.CurrentEntity]
        } catch {
            NSLog("Error: could not fetch objects")
        }
    }
    
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let records = controller.fetchedObjects as? [T.CurrentEntity] else { return }
        self.records.value = records
    }
    
    public func save() {
        DataSource.shared.saveContext()
    }
}
