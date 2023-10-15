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
    var signAmount = 0.0
    @Published var type = TransactionType.expense
    @Published var category = ""
    @Published var tabName: TransactionType = .expense
    @Published var isChoose: Category? = nil
    @Published var typePurchase = "Tiền mặt"
    var bankId = ""
    @Published var chooseBank: CreditCard? = nil
    
    let typePurchases = ["Tiền mặt", "Thẻ"]
    
    func save() async throws {
        guard let userId = Auth.auth().currentUser?.uid else {return}
        
        
        guard canSave else {
            return
        }
        
        if typePurchase == "Tiền mặt" {
            bankId = ""
        } else {
            bankId = chooseBank?.id ?? ""
        }
        
        if tabName.rawValue == "Expense" {
            signAmount = -amount
        } else {
            signAmount = amount
        }
        
        try await TransactionManager.shared.saveTransaction(id: userId, title: title, selectedDate: DateFormatter.vietnameseDateFormat.string(from: selectedDate), note: note, amount: amount, type: tabName.rawValue, typePurchase: typePurchase, bankId: bankId, category: isChoose?.name ?? "", categoryId: isChoose?.id ?? 1)
        
        if bankId != "" {
            CreditManager.shared.updateAmount(userId: userId, id: bankId, amount: signAmount)
        }
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty && isChoose != nil && amount != 0.0 && typePurchase == "Thẻ" && chooseBank != nil else {
            return false
        }
        
        return true
    }
}
