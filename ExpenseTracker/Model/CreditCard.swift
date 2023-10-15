//
//  CreditCard.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import Foundation
import SwiftUI
import SwiftUIFontIcon

struct CreditCard: Identifiable, Codable, Equatable {
    let id: String
    let bank: String
    var name: String
    let numID: String
    var amount: Double
    var qrImage: String
    
    var backImage: Image {
        if let bank = Bank.all.first(where: {$0.name == bank}) {
            return bank.image
        }
        return Image("Card 23")
    }
    
    var bankLogo: Image {
        if let logo = Bank.all.first(where: {$0.name == bank}) {
            return logo.logo
        }
        
        return Image("MB")
    }
}

struct Bank: Equatable {
    let id: Int
    let name: String
    let image: Image
    let logo: Image
}

extension Bank {
    static let mb = Bank(id: 1, name: "MB", image: Image("Card 1"), logo: Image("MB"))
    static let bidv = Bank(id: 2, name: "BIDV", image: Image("Card 2"), logo: Image("BIDV"))
    static let tpbank = Bank(id: 3, name: "TPBank", image: Image("Card 3"), logo: Image("TPBank"))
    static let agribank = Bank(id: 4, name: "Agribank", image: Image("Card 16"), logo: Image("Agribank"))
    static let hdbank = Bank(id: 5, name: "HDBank", image: Image("Card 17"), logo: Image("HDBank"))
    static let ocbank = Bank(id: 6, name: "OCBank", image: Image("Card 18"), logo: Image("OCB"))
    static let sacombank = Bank(id: 7, name: "Sacombank", image: Image("Card 25"), logo: Image("Sacombank"))
    static let seabank = Bank(id: 8, name: "Seabank", image: Image("Card 26"), logo: Image("Seabank"))
    static let shb = Bank(id: 9, name: "SHB", image: Image("Card 27"), logo: Image("SHB"))
    static let techcombank = Bank(id: 10, name: "Techcombank", image: Image("Card 28"), logo: Image("TCB"))
    static let vib = Bank(id: 11, name: "VIB", image: Image("Card 29"), logo: Image("VIB"))
    static let vietcombank = Bank(id: 12, name: "Vietcombank", image: Image("Card 30"), logo: Image("Vietcombank"))
    static let viettinbank = Bank(id: 13, name: "Viettinbank", image: Image("Card 31"), logo: Image("Viettinbank"))
    static let vpbank = Bank(id: 14, name: "VPBank", image: Image("Card 32"), logo: Image("VPBank"))
    static let abbank = Bank(id: 15, name: "ABBank", image: Image("Card 33"), logo: Image("ABBank"))
    
}

extension Bank {
    static let banks: [Bank] = [
        .mb,
        .bidv,
        .tpbank,
        .agribank,
        .hdbank,
        .ocbank,
        .sacombank,
        .seabank,
        .shb,
        .techcombank,
        .vib,
        .vietcombank,
        .viettinbank,
        .vpbank,
        .abbank
    ]
    
    static let all: [Bank] = banks
}
