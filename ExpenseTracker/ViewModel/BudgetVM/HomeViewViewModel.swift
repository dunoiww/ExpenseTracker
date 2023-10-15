//
//  HomeViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

typealias TransactionPrefixSum = [(String, Double)]
class HomeViewViewModel: ObservableObject {
    init() {}
    
    @Published var selectedTab = 0
    @Published var data: TransactionPrefixSum = []
    @Published var total = 0.0
    
    var transactions: [Transaction] = []
    var userId = Auth.auth().currentUser?.uid
    
    func getTransaction() async throws {
        guard let userId = userId else { return }
        transactions = try await TransactionManager.shared.fetchTransactionData(userId: userId)
    }
    
    func accumulateTransactions() async throws -> TransactionPrefixSum {
            do {
                try await getTransaction()
                guard !transactions.isEmpty else { return [] }
                
                
                let today = Date()
                let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
                
                var sum: Double = .zero
                var cumulativeSum = TransactionPrefixSum()
                
                for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
                    let dailyExpense = self.transactions.filter { $0.dateParsed == date && $0.type == TransactionType.expense.rawValue }
                    let dailyIncome = self.transactions.filter { $0.dateParsed == date && $0.type == TransactionType.income.rawValue}
                    let dailyExpenseTotal = dailyExpense.reduce(0, {$0 - $1.signedAmount})
                    let dailyIncomeTotal = dailyIncome.reduce(0, { $0 + $1.amount})
                    
                    sum = sum + (dailyIncomeTotal - dailyExpenseTotal)
                    cumulativeSum.append((date.formatted(), sum))
                }
                return cumulativeSum
            } catch {
                throw error
            }
        
        
    }
}
