//
//  TasksViewModel.swift
//  MVVM Boilerplate
//
//  Created by Lucas Menendez on 9/10/21.
//

import Combine
import SwiftUI

class TasksViewModel: ObservableObject {
    @Published var tasksModel = TasksModel.shared
    @Published var tasks: [TaskEntity] = []
    
    private var cancellable: AnyCancellable?
    
    init(publisher: AnyPublisher<[TaskEntity], Never> = TasksModel.shared.records.eraseToAnyPublisher()) {
        cancellable = publisher.sink { [unowned self] records in
            print("TasksViewModel: updating tasks")
            self.tasks = records
        }
    }
    
    func onCreateTask(desc: String = "New task") {
        tasksModel.create(desc: desc)
    }
    
    func onUpdateTask(task: TaskEntity, complete: Bool) {
        tasksModel.update(task: task, desc: task.desc, complete: complete)
    }
    
    func onDeleteTask(at indexSet: IndexSet) {
        if let index = indexSet.first {
            let toDelete: TaskEntity = tasks[index]
            tasksModel.delete(task: toDelete)
        }
    }
}
