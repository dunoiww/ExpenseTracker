//
//  CreditBudgetRow.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 13/10/2023.
//

import SwiftUI

struct CreditBudgetRow: View {
    @EnvironmentObject var currencyManager: CurrencyManager
    var creditCard: CreditCard
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 60)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            HStack {
                creditCard.bankLogo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 60)
                    .offset(x: 10)
                
                Spacer()
                
                Text(creditCard.amount, format: .currency(code: currencyManager.currentCurrency))
                    .font(.title2)
                    .padding()
            }
        }
    }
}

#Preview {
    CreditBudgetRow(creditCard: creditcardPreviewData)
        .environmentObject(CurrencyManager())
}
