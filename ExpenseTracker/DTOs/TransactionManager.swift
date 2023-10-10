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
    
    func fetchTransactionData(userId: String) async throws -> [Transaction] {
        let db = Firestore.firestore()
        var transactions: [Transaction] = []
        
        do {
            let snapshot = try await db.collection("users").document(userId).collection("transactions").getDocuments()
            
            for document in snapshot.documents {
                let transaction = Transaction(id: document["id"] as? String ?? "",
                                              title: document["title"] as? String ?? "",
                                              amount: document["amount"] as? Double ?? 0.0,
                                              note: document["note"] as? String ?? "",
                                              date: document["date"] as? String ?? "",
                                              type: document["type"] as? TransactionType.RawValue ?? "",
                                              category: document["category"] as? String ?? "",
                                              categoryId: document["categoryId"] as? Int ?? 0)
                
                transactions.append(transaction)
            }
            return transactions
        } catch {
            throw error
        }
    }
}
