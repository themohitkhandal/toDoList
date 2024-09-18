//
//  ToDoListViewVM.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import Foundation
import FirebaseFirestore

class ToDoListViewVM: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
//    Delete to do list item
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    
}
