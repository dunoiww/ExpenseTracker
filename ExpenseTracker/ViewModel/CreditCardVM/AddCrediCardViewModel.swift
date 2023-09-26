//
//  AddCrediCardViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 26/09/2023.
//

import Foundation

class AddCrediCardViewModel: ObservableObject {
    init() {}
    
    @Published var name = ""
    @Published var cardId = ""
    @Published var amount = 0.0
    
    func save() {
        
    }
}
