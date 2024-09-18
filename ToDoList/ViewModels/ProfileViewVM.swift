//
//  ProfileViewVM.swift
//  ToDoList
//
//  Created by Mohit Khandal on 23/05/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ProfileViewVM: ObservableObject {
    @Published var user: Users? = nil
    
    init () {}
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument{ [weak self] snapShot, error in
            guard let data = snapShot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = Users(
                    id: data["id"] as? String ?? "",
                                   name: data["name"] as? String ?? "",
                                   email: data["email"] as? String ?? "",
                                   joined: data["joined"] as? TimeInterval ?? 0)
            }
            
            
        }
    }
    
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
