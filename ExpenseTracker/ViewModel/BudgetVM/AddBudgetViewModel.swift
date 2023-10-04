//
//  AddBudgetViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 21/09/2023.
//

import Foundation

class AddBudgetViewModel: ObservableObject {
    init() {}
    
    @Published var selectedDate = Date()
    @Published var note = ""
    @Published var amount = 0.0
    @Published var type = TransactionType.expense
    @Published var category = ""
    @Published var tabName: TransactionType = .expense
    @Published var isChoose: Category? = nil
    
    func save() {
        print(isChoose?.name ?? "nam")
    }
}
