//
//  DreamGoal.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation

struct DreamGoal: Identifiable, Codable {
    var id: String
    var dream: String
    var currentMoney: Double
    var expectedMoney: Double
    var dateStart: String
    var dateExpected: String
    var isFinish: Int
    
    var dateStartParsed: Date {
        dateStart.dateParsed()
    }
    
    var dateExpectedParsed: Date {
        dateExpected.dateParsed()
    }
}
