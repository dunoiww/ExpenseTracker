//
//  QRViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 21/09/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth

class QRViewViewModel: ObservableObject {
    init() {}
    
    @Published var qrSelected = ""
    
    var transactions: [Transaction] = []
    
    func getDataTransaction() async throws {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        transactions = try await TransactionManager.shared.fetchTransactionData(userId: userId)
    }
}
