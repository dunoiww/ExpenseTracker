//
//  DetailTransactionView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 12/10/2023.
//

import SwiftUI
import SwiftUIFontIcon

struct DetailTransactionView: View {
    @EnvironmentObject var currencyManager: CurrencyManager
    var transaction: Transaction
    var body: some View {
        NavigationView {
            VStack {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 100)
                        .foregroundColor(.white)
                        .padding()
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color("Icon").opacity(0.5))
                            .frame(width: 40, height: 40)
                            .overlay(
                                FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: .blue)
                            )
                        
                        Text(transaction.title)
                            .font(.title2)
                    }
                }
                
                Form {
                    Section {
                        LabeledContent("Giá trị", value: transaction.amount, format: .currency(code: currencyManager.currentCurrency))
                        LabeledContent("Ngày", value: transaction.date)
                        LabeledContent("Phân loại", value: transaction.category)
                    } header: {
                        Text("Giao dịch")
                    }
                    
                    Section {
                        Text(transaction.note)
                    } header: {
                        Text("Ghi chú")
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color("Background"))
            }
            .navigationTitle("Chi tiết giao dịch")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("Background"))
        }
    }
}

#Preview {
    DetailTransactionView(transaction: transactionPreviewData)
        .environmentObject(CurrencyManager())
}
