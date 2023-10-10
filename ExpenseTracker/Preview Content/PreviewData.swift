//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 19/09/2023.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: "9", title: "Mua nhà", amount: 100000, note: "mua nhà mua nhà mua nhà mua nhà", date: "15/09/2023", type: "Income", category: "Nhà", categoryId: 801)

var transactionListPreviewData = [
    Transaction(id: "1", title: "Mua nhà", amount: 100000, note: "mua nhà mua nhà mua nhà mua nhà", date: "15/09/2023", type: "Expense", category: "Nhà", categoryId: 801),
    Transaction(id: "2", title: "Mua nhà", amount: 100000, note: "mua nhà mua nhà mua nhà mua nhà", date: "15/09/2023", type: "Expense", category: "Nhà", categoryId: 801),
    Transaction(id: "3", title: "Mua nhà", amount: 100000, note: "mua nhà mua nhà mua nhà mua nhà", date: "15/09/2023", type: "Expense", category: "Nhà", categoryId: 801),
    Transaction(id: "4", title: "Mua nhà", amount: 100000, note: "mua nhà mua nhà mua nhà mua nhà", date: "15/09/2023", type: "Expense", category: "Nhà", categoryId: 801),
    Transaction(id: "5", title: "Mua nhà", amount: 100000, note: "mua nhà mua nhà mua nhà mua nhà", date: "15/09/2023", type: "Expense", category: "Nhà", categoryId: 801),
    Transaction(id: "6", title: "Mua nhà", amount: 100000, note: "mua nhà mua nhà mua nhà mua nhà", date: "15/09/2023", type: "Expense", category: "Nhà", categoryId: 801),
    Transaction(id: "7", title: "Mua nhà", amount: 100000, note: "mua nhà mua nhà mua nhà mua nhà", date: "15/09/2023", type: "Expense", category: "Nhà", categoryId: 801),
    Transaction(id: "8", title: "Mua nhà", amount: 100000, note: "mua nhà mua nhà mua nhà mua nhà", date: "15/09/2023", type: "Expense", category: "Nhà", categoryId: 801)
]
var creditcardPreviewData = CreditCard(id: "5", bank: "MB", name: "Ngo Nam", numID: "123456789", amount: 10000000, qrImage: "xyz")

var creditcardListPreviewData = [CreditCard](repeating: creditcardPreviewData, count: 10)


var creditListPreviewData = [
    CreditCard(id: "1", bank: "MB", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc"),
    CreditCard(id: "2", bank: "BIDV", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc"),
    CreditCard(id: "3", bank: "TPBank", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc"),
    CreditCard(id: "4", bank: "Agribank", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc"),
    CreditCard(id: "5", bank: "HDBank", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc"),
    CreditCard(id: "6", bank: "OCBank", name: "Ngo Nam", numID: "123", amount: 1000, qrImage: "xyc")
]

var dreamGoalPreviewData = DreamGoal(id: UUID(), dream: "Buy House", currentMoney: 1234567, expectedMoney: 10000000, dateStart: "15/09/2023", dateExpected: "20/09/2023")

var dreamGoalListPreviewData = [
    DreamGoal(id: UUID(), dream: "Buy House", currentMoney: 100000, expectedMoney: 10000000, dateStart: "15/09/2023", dateExpected: "20/09/2023"),
    DreamGoal(id: UUID(), dream: "Buy Car", currentMoney: 200000, expectedMoney: 20000000, dateStart: "16/09/2023", dateExpected: "21/09/2023"),
    DreamGoal(id: UUID(), dream: "Buy iPhone", currentMoney: 300000, expectedMoney: 30000000, dateStart: "17/09/2023", dateExpected: "22/09/2023"),
    DreamGoal(id: UUID(), dream: "Buy MacBook", currentMoney: 400000, expectedMoney: 40000000, dateStart: "18/09/2023", dateExpected: "23/09/2023"),
    DreamGoal(id: UUID(), dream: "Buy Apple Watch", currentMoney: 50000000, expectedMoney: 50000000, dateStart: "19/09/2023", dateExpected: "24/09/2023"),
    DreamGoal(id: UUID(), dream: "Buy Island", currentMoney: 600000, expectedMoney: 60000000, dateStart: "20/09/2023", dateExpected: "25/09/2023"),
    DreamGoal(id: UUID(), dream: "Buy Plane", currentMoney: 700000, expectedMoney: 70000000, dateStart: "21/09/2023", dateExpected: "26/09/2023"),
    DreamGoal(id: UUID(), dream: "Buy Plane", currentMoney: 700000, expectedMoney: 70000000, dateStart: "21/09/2023", dateExpected: "26/09/2023"),
    DreamGoal(id: UUID(), dream: "Buy Plane", currentMoney: 700000, expectedMoney: 70000000, dateStart: "21/09/2023", dateExpected: "26/09/2023"),
    DreamGoal(id: UUID(), dream: "Buy Plane", currentMoney: 700000, expectedMoney: 70000000, dateStart: "21/09/2023", dateExpected: "26/09/2023"),
    DreamGoal(id: UUID(), dream: "Buy Plane", currentMoney: 700000, expectedMoney: 70000000, dateStart: "21/09/2023", dateExpected: "26/09/2023"),
]
