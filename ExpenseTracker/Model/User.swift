//
//  User.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation
import FirebaseAuth

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let photoUrl: String
}
