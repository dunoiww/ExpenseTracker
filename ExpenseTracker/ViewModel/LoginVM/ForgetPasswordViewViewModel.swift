//
//  ForgetPasswordViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 02/10/2023.
//

import Foundation

class ForgetPasswordViewViewModel: ObservableObject {
    init () {}
    
    @Published var email = ""
    
    func forget() async throws {
        guard validate() else {return}
        try await AuthenticationManager.shared.forgetPassword(email: email)
    }
    
    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        return true
    }
}
