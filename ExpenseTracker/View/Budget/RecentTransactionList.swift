//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 19/09/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct RecentTransactionList: View {
    @StateObject var viewModel = RecentTransactionListViewModel()
    @FirestoreQuery var transaction: [Transaction]
    @EnvironmentObject var currencyManager: CurrencyManager
    
    init(userId: String) {
        self._transaction = FirestoreQuery(collectionPath: "users/\(userId)/transactions", predicates: [.order(by: "date", descending: true)])
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Giao dịch")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.medium)
                
                Spacer()
                
                NavigationLink {
                    SeeAllView(userId: viewModel.userId ?? "rjAHDPqtNpTzMQ7UK5acmnRrOAH3")
                } label: {
                    HStack {
                        Text("Tất cả")
                        Image(systemName: "chevron.forward")
                    }
                    .foregroundColor(Color.blue)
                }
            }
            .padding(.top)
            
            
            //MARK: Recent transaction list
            ForEach(transaction.prefix(5)) { transaction in
                TransactionRow(transaction: transaction)
                
            }
        }
        .padding()
//        .background(Color(uiColor: .systemBackground))
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static var previews: some View {
        RecentTransactionList(userId: "rjAHDPqtNpTzMQ7UK5acmnRrOAH3")
            .environmentObject(CurrencyManager())
    }
}
