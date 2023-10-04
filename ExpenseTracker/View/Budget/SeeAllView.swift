//
//  SeeAllView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 04/10/2023.
//

import SwiftUI

struct SeeAllView: View {
    @StateObject var viewModel = SeeAllViewViewModel()
    var body: some View {
        VStack {
            List {
                ForEach(Array(viewModel.groupTransactionByMonth()), id: \.key) { month, transactions in
                    Section {
                        //MARK: transaction by month
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        //MARK: transaction month
                        Text(month)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            
        }
        .navigationTitle("Lịch sử giao dịch")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        SeeAllView()
    }
}
