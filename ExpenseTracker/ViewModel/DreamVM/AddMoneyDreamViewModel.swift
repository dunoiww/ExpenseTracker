//
//  AddMoneyDreamViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 28/09/2023.
//

import Foundation
import FirebaseAuth

class AddMoneyDreamViewModel: ObservableObject {
    init() {}
    
    @Published var amount = 0.0
    @Published var showAlert = false
    var dream: DreamGoal = dreamGoalPreviewData
    
    func save() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        guard canSave else { return }
        
        DreamManager.shared.addMoney(userId: userId, amount: amount, dream: dream)
    }
    
    var canSave: Bool {
        guard amount != 0.0 else { return false }
        
        return true
    }
    
    var isFinish: Bool {
        if dream.currentMoney >= dream.expectedMoney {
            return true
        }
        return false
    }
}
