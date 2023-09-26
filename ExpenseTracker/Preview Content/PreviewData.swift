//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 19/09/2023.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: UUID(), title: "Buy house", amount: 100000, note: "Buy house for my parents", date: "15/09/2030", type: "Expense", category: "Home", categoryId: 801)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)

var creditcardPreviewData = CreditCard(id: 5, bank: "MB", name: "Ngo Nam", numID: "123456789", amount: 10000000, qrImage: "xyz")

var creditcardListPreviewData = [CreditCard](repeating: creditcardPreviewData, count: 10)


var creditListPreviewData = [
    CreditCard(id: 1, bank: "MB", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc"),
    CreditCard(id: 2, bank: "BIDV", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc"),
    CreditCard(id: 3, bank: "TP Bank", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc"),
    CreditCard(id: 4, bank: "Agribank", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc"),
    CreditCard(id: 5, bank: "HDBank", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc"),
    CreditCard(id: 6, bank: "OCBank", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc")
]
