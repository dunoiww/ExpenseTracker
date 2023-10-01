//
//  RegisterViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func createAccount() {
        guard validate() else {
            return
        }
        
        AuthenticationManager.shared.Register(name: username, email: email, password: password, photoUrl: "")
        
        print("ngo nam")
    }
    
    private func validate() -> Bool {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
