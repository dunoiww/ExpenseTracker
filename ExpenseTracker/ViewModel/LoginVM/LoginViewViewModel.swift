//
//  LoginViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 14/09/2023.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    init() {}
    
    @Published var email = ""
    @Published var password = ""
    @Published var msg = ""
    
    func login() {
        guard validate() else { return }
        
        AuthenticationManager.shared.login(email: email, password: password)
    }
    
    private func validate() -> Bool {
        msg = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            msg = "Hãy điền đầy đủ thông tin."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".com") else {
            msg = "Email không hợp lệ."
            return false
        }
        
        return true
    }
}
