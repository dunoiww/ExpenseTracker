//
//  LoginViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 14/09/2023.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    init() {
        self.handler = Auth.auth().addStateDidChangeListener({[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUser = user?.uid ?? ""
            }
        })
    }
    
    @Published var email = ""
    @Published var password = ""
    @Published var msg = ""
    
    @Published var currentUser = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    func login() {
        guard validate() else { return }
        
        AuthenticationManager.shared.login(email: email, password: password)
        
        if currentUser == "" {
            msg = "Sai thông tin tài khoản hoặc mật khẩu!"
        }
    }
    
    private func validate() -> Bool {
        msg = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            msg = "Hãy điền đầy đủ thông tin!"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".com") else {
            msg = "Email không hợp lệ!"
            return false
        }
        
        return true
    }
}
