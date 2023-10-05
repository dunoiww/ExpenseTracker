//
//  TransactionServices.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 04/10/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TransactionManager {
    static let shared = TransactionManager()
    
    init() {}
    
    func saveTransaction(id: String, title: String, selectedDate: String, note: String, amount: Double, type: TransactionType.RawValue, category: String, categoryId: Int) async throws {
        
        let newId = UUID().uuidString
        let newTransaction = Transaction(id: newId, title: title, amount: amount, note: note, date: selectedDate, type: type, category: category, categoryId: categoryId)
        
        let db = Firestore.firestore()
        try await db.collection("users")
            .document(id)
            .collection("transactions")
            .document(newId)
            .setData(newTransaction.asDictionary())
        
    }
}
