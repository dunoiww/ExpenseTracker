//
//  InfoViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 30/09/2023.
//

import Foundation

class InfoViewViewModel: ObservableObject {
    init() {}
    
    func logout() {
        AuthenticationManager.shared.logout()
    }
}
