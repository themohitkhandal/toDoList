//
//  Users.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import Foundation

struct Users: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
