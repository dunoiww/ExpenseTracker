//
//  AddCreditCard.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 21/09/2023.
//

import SwiftUI

struct AddCreditCard: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = AddCrediCardViewModel()
    var body: some View {
        ScrollView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("Transaction"), .white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Add Credit Card")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    VStack {
                        HStack(spacing: 20) {
                            Text("Name")
                                .font(.title2)
                                .bold().opacity(0.7)
                                .padding(.trailing, 20)
                            TextField("Your name", text: $viewModel.name)
                                .font(.system(size: 20))
                                .textFieldStyle(DefaultTextFieldStyle())
                                .autocorrectionDisabled()
                                .padding()
                        }
                        .padding(.leading, 16)
                        
                        HStack {
                            Text("Amount")
                                .font(.title2)
                                .bold().opacity(0.7)
                                .padding(.trailing, 15)
                            TextField("Amount", value: $viewModel.amount, format: .currency(code: "VND"))
                                .font(.system(size: 20))
                        }
                        .padding(.leading, 16)
                        
                        VStack {
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                                ForEach(Bank.banks, id: \.id) { bank in
                                    Button {
                                        
                                    } label: {
                                        VStack {
                                            bank.logo
                                                .resizable()
                                                .scaledToFit()
                                                .padding()
                                                .frame(width: 120, height: 80)
                                        }
                                        .background(.white).cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                        )
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        ButtonAdd(title: "Save") {
                            viewModel.save()
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddCreditCard()
}
