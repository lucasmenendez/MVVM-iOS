# MVVM-iOS
MVVM iOS Boilerplate App using SwiftUI, Combine and CoreData.

## Demo app

![demo app](https://github.com/lucasmenendez/MVVM-iOS/blob/main/demo.gif?raw=true)

## Core features

* MVVM architecture.
* SwiftUI for views.
* Combine for efficient reactive changes.
* CoreData for data persistance.

### Boilerplate utils

#### CoreData DataSource

Implements CoreData connection and publish it via singleton.

| Source code | Example |
|:---:|:---:|
| [`MVVM Boilerplate/DataSource/DataSource.swift`](./MVVM%20Boilerplate/DataSource/DataSource.swift) | `None` |

#### CoreData Entity

Provide a protocol to implement other CoreData entities. 

| Source code | Example |
|:---:|:---:|
| [`MVVM Boilerplate/Entities/Entity.swift`](./MVVM%20Boilerplate/Entities/Entity.swift) | [`MVVM Boilerplate/Entities/TaskEntity.swift`](./MVVM%20Boilerplate/Entities/TaskEntity.swift) |

When a CoreData entity is managed by a developer defined class: 
 * `Class > Name` entity configuration of data model must be equal to class name, ex.: `TaskEntity`.
 * `Class > Codegen` entity configuration of data model must be `Manual/None`.

#### Entities Model

Extendable class that implements some functions to provide reactive CoreData entities changes.

| Source code | Example |
|:---:|:---:|
| [`MVVM Boilerplate/Models/Model.swift`](./MVVM%20Boilerplate/Models/Model.swift) | [`MVVM Boilerplate/Models/TasksModel.swift`](./MVVM%20Boilerplate/Models/TasksModel.swift) |