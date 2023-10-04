//
//  InfoViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 30/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class InfoViewViewModel: ObservableObject {
    init() {}
    
    @Published var showAlert = false
    @Published var fetchData = false
    @Published var user: User? = nil
    
    func fetchUser() async throws {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        do {
            let fetchedData = try await AuthenticationManager.shared.fetchUserData(userId: userId)
            
            DispatchQueue.main.async {
                self.user = fetchedData
            }
        } catch {
            throw error
        }
    }
    
    func logout() {
        AuthenticationManager.shared.logout()
    }
}
