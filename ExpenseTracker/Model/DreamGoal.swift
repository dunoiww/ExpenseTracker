//
//  DreamGoal.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation

struct DreamGoal: Identifiable {
    var id: UUID
    var dream: String
    var icon: String
    var currentMoney: Double
    var expectedMoney: Double
    var dateStart: Date
    var dateExpected: Date
}
