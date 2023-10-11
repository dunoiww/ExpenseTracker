//
//  Extension.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 18/09/2023.
//

import Foundation
import SwiftUI

extension DateFormatter {
    static let vietnameseDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.vietnameseDateFormat.date(from: self) else { return Date() }
        
        return parsedDate
    }
}


enum NetworkingError: Error {
    case connectionLost
    case serverError
    case invalidResponse
}

let vietnameseLocale: Locale = Locale(identifier: "vi_VN")

