//
//  MainViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation

class MainViewViewModel: ObservableObject {
    init() {}
    
    @Published var selectedTab = 0
    @Published var showAddBudget = false
    @Published var showAddCrediCard = false
    @Published var showAddDream = false
    @Published var showSetting = false
    
    
    func isLogin() -> Bool {
        return true
    }
}
