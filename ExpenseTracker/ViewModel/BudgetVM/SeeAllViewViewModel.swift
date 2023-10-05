//
//  SeeAllViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 04/10/2023.
//

import Foundation

typealias TransactionGroup = [String : [Transaction]]
class SeeAllViewViewModel: ObservableObject {
    init() {}
    
    
    func groupTransactionByMonth(transactions: [Transaction]) -> TransactionGroup {
        guard !transactions.isEmpty else {
            return [:]
        }
        
        let groupTransactions = TransactionGroup(grouping: transactions) { $0.month }
        
        return groupTransactions
    }
}
