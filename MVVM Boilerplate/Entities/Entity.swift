//
//  Entity.swift
//  MVVM Boilerplate
//
//  Created by Lucas Menendez on 9/10/21.
//

import CoreData

protocol Entity: NSFetchRequestResult {
    associatedtype CurrentEntity: NSManagedObject
    static var entityName: String { get }
    static func fetchRequest() -> NSFetchRequest<CurrentEntity>
}
