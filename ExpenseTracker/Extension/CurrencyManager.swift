//
//  CurrencyManager.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 14/10/2023.
//

import Foundation

class CurrencyManager: ObservableObject {
    @Published var currentCurrency = "VND"
    
    func changeCurrency(currency: String) {
        self.currentCurrency = currency
    }
}
