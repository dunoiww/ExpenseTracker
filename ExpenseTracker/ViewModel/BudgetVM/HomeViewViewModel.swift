//
//  HomeViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation
import FirebaseAuth

class HomeViewViewModel: ObservableObject {
    init() {}
    
    @Published var selectedTab = 0
    
    var userId = Auth.auth().currentUser?.uid
    
}
