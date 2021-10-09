//
//  TasksModel.swift
//  MVVM Boilerplate
//
//  Created by Lucas Menendez on 9/10/21.
//

import os
import CoreData

class TasksModel: Model<TaskEntity> {
    static let shared: TasksModel = TasksModel()
    
    func create(desc: String) {
        let newTask = TaskEntity(context: DataSource.shared.viewContext)
        newTask.setValue(UUID(), forKey: "uuid")
        newTask.setValue(desc, forKey: "desc")
        newTask.setValue(false, forKey: "complete")
        
        save()
    }
    
    func update(task: TaskEntity, desc: String, complete: Bool) {
        task.desc = desc
        task.complete = complete
        save()
    }
    
    func delete(task: TaskEntity) {
        DataSource.shared.viewContext.delete(task)
        
        save()
    }
}
