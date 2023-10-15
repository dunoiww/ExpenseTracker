//
//  SearchViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 12/10/2023.
//

import Foundation
import FirebaseAuth


class SearchViewViewModel: ObservableObject {
    init() {}
    
    @Published var searchText = ""
    @Published var atoz = true
    @Published var ztoa = false
    @Published var selectedDate = Date()
    @Published var isShowingDateTimePicker = false
    
    var transactions: [Transaction] = []
    
    func fetchTransaction() async throws {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        do {
            transactions = try await TransactionManager.shared.fetchTransactionData(userId: userId)
        } catch {
            print(error)
        }
    }
    
    var filter: [Transaction] {
        if searchText.isEmpty {
            if atoz {
                return transactions.sorted { $0.amount < $1.amount }
            }
            else {
                return transactions.sorted { $0.amount > $1.amount }
            }
        } else {
            return transactions.filter { $0.title.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
}
