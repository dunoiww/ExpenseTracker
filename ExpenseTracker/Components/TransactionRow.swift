//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 18/09/2023.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 70)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.57, green: 0.78, blue: 0.89), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.7, green: 0.76, blue: 0.79), location: 1.00),
                            Gradient.Stop(color: Color(red: 0.57, green: 0.78, blue: 0.89).opacity(0), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 1, y: 0)
                    )
                )
                .cornerRadius(20)
            HStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color("Icon").opacity(0.3))
                    .frame(width: 45, height: 45)
                    .overlay(
                        FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color("Icon"))
                    )
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(transaction.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Text(transaction.note)
                        .font(.system(size: 12))
                        .opacity(0.7)
                        .lineLimit(1)
                    
                    Text(transaction.category)
                        .font(.system(size: 12))
                        .opacity(0.7)
                        .lineLimit(1)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(transaction.signedAmount, format: .currency(code: "VND"))
                        .font(.headline)
                        .bold()
                        .foregroundColor(transaction.signedAmount > 0 ? Color("amountGreen") : .red)
                    
                    Text(DateFormatter.vietnameseDateFormat.string(from: transaction.dateParsed))
                        .font(.footnote)
                        .opacity(0.7)
                }
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 1)
        }
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: transactionPreviewData)
    }
}
