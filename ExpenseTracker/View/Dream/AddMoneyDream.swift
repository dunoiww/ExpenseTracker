//
//  AddMoneyDream.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 28/09/2023.
//

import SwiftUI

struct AddMoneyDream: View {
    @StateObject var viewModel = AddMoneyDreamViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Transaction"), .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Biến ước mơ của bạn thành sự thật!")
                    .font(.title)
                    .bold()
                    .padding()
                    .foregroundColor(.black)
                
                Form {
                    Section(header: Text("Số tiền hôm nay!")) {
                        HStack {
                            Text("Tiền hôm nay:")
                                .frame(width: 130, alignment: .leading)
                                .font(.system(size: 20))
                            
                            TextField("money", value: $viewModel.amount, format: .currency(code: "VND"))
                                .font(.system(size: 20))
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.8))
                }
                .scrollDisabled(true)
                .frame(height: 100)
                .background(.gray.opacity(0.2))
                .scrollContentBackground(.hidden)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                .padding()
                
                Spacer()
                
                ButtonAdd(title: "Lưu") {
                    viewModel.save()
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddMoneyDream()
}
