//
//  RegisterViewVM.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation
import SwiftUI

class RegisterViewVM: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    init() {}
    
    func register() {
        
        guard validate() else {
            return
        }
        print("Inside register") 
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            
            
            if let maybeError = error as NSError? {
                let err = maybeError as NSError
                print("Error Message: ",err)
                switch err.code {
                        case AuthErrorCode.emailAlreadyInUse.rawValue:
                            self?.showAlert = true
                            self?.alertMessage = err.localizedDescription
                        case AuthErrorCode.invalidEmail.rawValue:
                            self?.showAlert = true
                            self?.alertMessage = err.localizedDescription
                        case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                            self?.showAlert = true
                            self?.alertMessage = err.localizedDescription
                        default:
                            self?.showAlert = true
                            self?.alertMessage = err.localizedDescription
                            print("unknown error: \(err.localizedDescription)")
                        }
                
                return
            }
            
            guard let userId = result?.user.uid else {
                return
            }
            
            print("auth response : ", result?.user ?? "No User Created")
            
            self?.insertUserRecords(id: userId)
            
        }
    }
    
    private func insertUserRecords(id: String) {
        let newUser = Users(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate() -> Bool {
        print("Inside validate()")
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter a name"
            return false
        }
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count >= 6, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Password should be more than 6 letters"
            return false
        }
        
        return true
    }
}
