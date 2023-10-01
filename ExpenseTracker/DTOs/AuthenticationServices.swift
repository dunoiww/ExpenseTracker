//
//  AuthenticationServices.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 29/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    private init() {}
    
    func Register(name: String, email: String, password: String, photoUrl: String) {
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userId = result?.user.uid else { return }
            
            self?.insertUserRecord(id: userId, name: name, email: email, photoUrl: photoUrl)
        }
    }
    
    private func insertUserRecord(id: String, name: String, email: String, photoUrl: String) {
        let newUser = User(id: id, name: name, email: email, photoUrl: photoUrl)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func forgetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
