//
//  Extension.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 18/09/2023.
//

import Foundation
import SwiftUI

extension View {
    func stacked(at position: Int, total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: offset * 50, y: 0)
    }
}

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
