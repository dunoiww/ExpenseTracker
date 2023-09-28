//
//  AddDreamViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 27/09/2023.
//

import Foundation

class AddDreamViewModel: ObservableObject {
    init() {}
    
    @Published var dream = ""
    @Published var amount = 0.0
    @Published var dateStart = Date()
    @Published var dateExpect = Date()
    
    func save() {
        
    }
}
