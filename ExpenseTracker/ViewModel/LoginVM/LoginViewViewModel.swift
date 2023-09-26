//
//  LoginViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 14/09/2023.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    init() {}
    
    @Published var username = ""
    @Published var password = ""
    
    func login() {
        
    }
}
