//
//  TasksView.swift
//  MVVM Boilerplate
//
//  Created by Lucas Menendez on 9/10/21.
//

import SwiftUI

struct TasksView: View {
    @State var taskValue: String = ""
    @StateObject var viewModel: TasksViewModel = TasksViewModel()
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    TextField("Create new task", text: $taskValue)
                    Button {
                        viewModel.onCreateTask(desc: taskValue)
                        taskValue = ""
                    } label: {
                        Text("Add")
                    }
                    .disabled(taskValue == "")
                }
                
                ForEach(viewModel.tasks) { task in
                    HStack(alignment: .center, spacing: 20) {
                        Button {
                            viewModel.onUpdateTask(task: task, complete: !task.complete)
                        } label: {
                            Image(systemName: task.complete ? "checkmark.circle.fill" : "circle")
                                .font(.system(size: 24))
                        }
                        Text(task.desc)
                    }
                }
                .onDelete(perform: viewModel.onDeleteTask)
            }
            .navigationTitle("TO-DO")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
