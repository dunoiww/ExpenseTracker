//
//  RecentTransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 19/09/2023.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseAuth

class RecentTransactionListViewModel: ObservableObject {
    init() {}
    
    var userId = Auth.auth().currentUser?.uid
}
