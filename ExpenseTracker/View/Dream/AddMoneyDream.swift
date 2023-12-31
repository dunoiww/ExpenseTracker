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
    @EnvironmentObject var currencyManager: CurrencyManager
    let dream: DreamGoal
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Transaction"), .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            if viewModel.isFinish {
                VStack {
                    Text("Hãy tận hưởng ước mơ của bạn đi nào!")
                        .font(.title)
                }
            } else {
                VStack {
                    Text("Biến ước mơ của bạn thành sự thật!")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundColor(.black)
                    
                    Form {
                        Section(header: Text("Số tiền hôm nay!")) {
                            HStack {
                                TextField("money", value: $viewModel.amount, format: .number)
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
                    
                    HStack {
                        Text("Bạn còn cách ước mơ của mình: ")
                        Text(Double(dream.expectedMoney - dream.currentMoney).rounded(), format: .currency(code: currencyManager.currentCurrency))
                    }
                    .italic()
                    
                    if viewModel.amount > Double(dream.expectedMoney - dream.currentMoney).rounded() {
                        Text("Bạn đã nhập số tiền lớn hơn số tiền cần thiết.")
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    Spacer()
                    
                    ButtonAdd(title: "Lưu") {
                        viewModel.save()
                    }
                    
                    Spacer()
                        .frame(height: 100)
                }
            }
            
        }
        .onAppear {
            viewModel.dream = dream
        }
    }
}

#Preview {
    NavigationView {
        AddMoneyDream(dream: dreamGoalPreviewData)
            .environmentObject(CurrencyManager())
    }
}
