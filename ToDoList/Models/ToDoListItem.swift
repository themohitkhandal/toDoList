//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title :String
    let dueDate : TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
