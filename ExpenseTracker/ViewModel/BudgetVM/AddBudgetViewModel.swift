//
//  AddBudgetViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 21/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddBudgetViewModel: ObservableObject {
    init() {}
    
    @Published var title = ""
    @Published var selectedDate = Date()
    @Published var note = ""
    @Published var amount = 0.0
    @Published var type = TransactionType.expense
    @Published var category = ""
    @Published var tabName: TransactionType = .expense
    @Published var isChoose: Category? = nil
    
    func save() async throws {
        guard let userId = Auth.auth().currentUser?.uid else {return}
        
        
        guard canSave else {
            return
        }
        
        try await TransactionManager.shared.saveTransaction(id: userId, title: title, selectedDate: DateFormatter.vietnameseDateFormat.string(from: selectedDate), note: note, amount: amount, type: tabName.rawValue, category: isChoose?.name ?? "", categoryId: isChoose?.id ?? 1)
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty && isChoose != nil && amount != 0.0 else {
            return false
        }
        
        return true
    }
}
