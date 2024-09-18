//
//  ContentViewVM.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//
import FirebaseAuth
import Foundation

class ContentViewVM: ObservableObject {
    @Published var currentUserID: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        print("isSignedIn", Auth.auth().currentUser != nil)
        return Auth.auth().currentUser != nil
    }
}
