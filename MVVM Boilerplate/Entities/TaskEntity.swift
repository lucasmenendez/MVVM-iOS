//
//  TaskEntity.swift
//  MVVM Boilerplate
//
//  Created by Lucas Menendez on 9/10/21.
//

import os
import CoreData

@objc(TaskEntity)
public class TaskEntity: NSManagedObject {
    

}

extension TaskEntity: Entity {
    typealias CurrentEntity = TaskEntity
    static let entityName: String = "Task"
    
    public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        let request = NSFetchRequest<TaskEntity>(entityName: TaskEntity.entityName)
        request.sortDescriptors = []
        return request
    }
}

extension TaskEntity: Identifiable {
    public var ID: String {
        self.uuid.uuidString
    }
}

extension TaskEntity {
    @NSManaged public var uuid: UUID
    @NSManaged public var desc: String
    @NSManaged public var complete: Bool
}
