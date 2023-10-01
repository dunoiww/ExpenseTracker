//
//  MainViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    init() {
        self.handler = Auth.auth().addStateDidChangeListener({[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUser = user?.uid ?? ""
            }
        })
    }
    
    @Published var selectedTab = 0
    @Published var showAddBudget = false
    @Published var showAddCrediCard = false
    @Published var showAddDream = false
    @Published var showSetting = false
    
    @Published var currentUser = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    
    
    
    public var isLogin: Bool {
        return Auth.auth().currentUser != nil
    }
}
