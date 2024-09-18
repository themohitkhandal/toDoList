//
//  LoginViewVM.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import FirebaseAuth
import Foundation

class LoginViewVM: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    init() {
        
    }
    
    func login () {
        guard validate() else {
            return
        }
//        Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate () -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all the fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        return true
    }
}
