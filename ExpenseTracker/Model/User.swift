//
//  User.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation

struct User: Codable, Identifiable {
    var id: UUID
    let username: String
    let email: String
    let avatarURL: String
}
