//
//  SeeAllView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 04/10/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct SeeAllView: View {
    @StateObject var viewModel = SeeAllViewViewModel()
    @FirestoreQuery var transactions: [Transaction]
    
    init(userId: String) {
        self._transactions = FirestoreQuery(collectionPath: "users/\(userId)/transactions", predicates: [.order(by: "date", descending: true)])
    }
    var body: some View {
        VStack {
            List {
                ForEach(Array(viewModel.groupTransactionByMonth(transactions: transactions)), id: \.key) { month, transactions in
                    Section {
                        //MARK: transaction by month
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                                .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        }
                    } header: {
                        //MARK: month
                        Text(month)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color("Background"))
                }
            }
            .listStyle(.plain)
            .background(Color("Background"))
           
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 50)
                .foregroundColor(Color("Background"))
        }
        .navigationTitle("Lịch sử giao dịch")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("Background"))
    }
}

#Preview {
    NavigationView {
        SeeAllView(userId: "rjAHDPqtNpTzMQ7UK5acmnRrOAH3")
    }
}
