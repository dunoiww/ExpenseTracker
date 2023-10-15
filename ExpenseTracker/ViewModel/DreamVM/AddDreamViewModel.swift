//
//  AddDreamViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 27/09/2023.
//

import Foundation
import FirebaseAuth

class AddDreamViewModel: ObservableObject {
    init() {}
    
    @Published var dream = ""
    @Published var currentAmount: Double = 0.0
    @Published var amount: Double = 0.0
    @Published var dateStart = Date()
    @Published var dateExpect = Date()
    
    func save() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        guard canSave else { return }
        
        let newId = UUID().uuidString
        
        DreamManager.shared.addDream(userId: userId, id: newId, dream: dream, currentAmount: currentAmount, amount: amount, dateStart: DateFormatter.vietnameseDateFormat.string(from: dateStart), dateExpect: DateFormatter.vietnameseDateFormat.string(from: dateExpect))
    }
    
    var canSave: Bool {
        guard !dream.trimmingCharacters(in: .whitespaces).isEmpty &&
                amount != 0.0 &&
                dateExpect >= dateStart
        else {
            return false
        }
        return true
    }
    
    var daybyday: Double {
        if dateExpect == dateStart {
            return amount - currentAmount
        }
        return ((amount - currentAmount)/Double(daysDifference(dateStart: dateStart, dateExpect: dateExpect) + 1)).rounded()
    }
}
