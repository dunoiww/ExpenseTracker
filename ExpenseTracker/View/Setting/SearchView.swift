//
//  SearchView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 12/10/2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewViewModel()
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(height: 50)
                    
                    TextField("search", text: $viewModel.searchText)
                        .autocorrectionDisabled()
                        .padding()
                }
                HStack {
                    Menu {
                        Button {
                            viewModel.atoz = true
                            viewModel.ztoa = false
                        } label: {
                            HStack {
                                Text("Từ thấp đến cao")
                                Image(systemName: "arrow.up")
                            }
                        }
                        
                        Button {
                            viewModel.atoz = false
                            viewModel.ztoa = true
                        } label: {
                            HStack {
                                Text("Từ cao đến thấp")
                                Image(systemName: "arrow.down")
                            }
                        }
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.system(size: 24))
                    }
                }
            }
            .padding()
            
            List {
                ForEach(viewModel.filter) { transaction in
                    NavigationLink {
                        DetailTransactionView(transaction: transaction)
                    } label: {
                        TransactionRow(transaction: transaction)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 5, leading: -12, bottom: 5, trailing: 0))
                    .offset(x: 15)
                    .listRowBackground(Color("Background"))
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .scrollContentBackground(.hidden)
            .background(Color("Background"))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 50)
                .foregroundColor(Color("Background"))
        }
        .navigationTitle("Tìm kiếm giao dịch")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("Background"))
        .task {
            do {
                try await viewModel.fetchTransaction()
            } catch {
                print(error)
            }
        }
    }
    
}

#Preview {
    NavigationView {
        SearchView()
    }
}
