//
//  NewItemViewVM.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewItemViewVM: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    init() {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // Create model
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id: newID,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        print("newItem", newItem.asDictionary())
        
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
