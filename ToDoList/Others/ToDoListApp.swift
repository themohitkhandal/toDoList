//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Mohit Khandal on 20/05/24.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()  
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
