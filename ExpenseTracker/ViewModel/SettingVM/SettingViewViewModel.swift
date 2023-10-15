//
//  SettingViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 14/10/2023.
//

import Foundation

class SettingViewViewModel: ObservableObject {
    init() {}
    
    @Published var currency = "VND"
    
    let currencies = ["VND", "USD"]
    
    var currentCurrency = CurrencyManager()
}
