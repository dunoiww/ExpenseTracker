//
//  Income.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable {
    var id: UUID
    var title: String
    var amount: Double
    var note: String
    var date: String
    var type: TransactionType.RawValue
    var category: String
    var categoryId: Int
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category.icon
        }
        
        return .question
    }
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.income.rawValue ? amount : -amount
    }
}

enum TransactionType: String {
    case income = "Income"
    case expense = "Expense"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
    let type: TransactionType.RawValue
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Transport", icon: .car_alt, type: "Expense")
    static let billsAndUtilities = Category(id: 2, name: "Bills", icon: .file_invoice_dollar, type: "Expense")
    static let entertainment = Category(id: 3, name: "Entertainment", icon: .film, type: "Expense")
    static let feesAndCharges = Category(id: 4, name: "Fees", icon: .hand_holding_usd, type: "Expense")
    static let foodAndDining = Category(id: 5, name: "Food", icon: .hamburger, type: "Expense")
    static let home = Category(id: 6, name: "Home", icon: .home, type: "Expense")
    static let income = Category(id: 7, name: "Income", icon: .dollar_sign, type: "Expense")
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart, type: "Expense")
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt, type: "Expense")
    
    static let salary = Category(id: 10, name: "Salary", icon: .dollar_sign, type: "Income")
    static let allowance = Category(id: 11, name: "Allowance", icon: .piggy_bank, type: "Income")
    static let bonus = Category(id: 12, name: "Bonus", icon: .gift, type: "Income")
    static let invest = Category(id: 13, name: "Invest", icon: .coins, type: "Income")
    static let wage = Category(id: 14, name: "Wage", icon: .funnel_dollar, type: "Income")
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1, type: "Income")
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1, type: "Income")
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: .mobile_alt, mainCategoryId: 2, type: "Income")
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", icon: .film, mainCategoryId: 3, type: "Income")
    static let bankFee = Category(id: 401, name: "Bank Fee", icon: .hand_holding_usd, mainCategoryId: 4, type: "Income")
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: .hand_holding_usd, mainCategoryId: 4, type: "Income")
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5, type: "Income")
    static let restaurants = Category(id: 502, name: "Restaurants", icon: .utensils, mainCategoryId: 5, type: "Income")
    static let rent = Category(id: 601, name: "Rent", icon: . house_user, mainCategoryId: 6, type: "Income")
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .lightbulb, mainCategoryId: 6, type: "Income")
    static let paycheque = Category(id: 701, name: "Paycheque", icon: .dollar_sign, mainCategoryId: 7, type: "Income")
    static let software = Category(id: 801, name: "Software", icon: .icons, mainCategoryId: 8, type: "Income")
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: .exchange_alt, mainCategoryId: 9, type: "Income")
}

extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer,
        .salary,
        .allowance,
        .bonus,
        .invest,
        .wage,
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment,
    ]
    
    
    static let all: [Category] = categories + subCategories
}
