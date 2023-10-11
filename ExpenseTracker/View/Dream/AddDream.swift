//
//  AddDream.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 21/09/2023.
//

import SwiftUI

struct AddDream: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AddDreamViewModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Transaction"), .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Vẽ Ước Mơ!")
                    .font(.title)
                    .bold()
                    .padding()
                
                Form {
                    Section(header: Text("Ước mơ của bạn")) {
                        HStack {
                            Text("Ước mơ: ")
                                .font(.system(size: 20))
                                .frame(width: 100, alignment: .leading)
                            
                            TextField("ước mơ", text: $viewModel.dream)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .font(.system(size: 20))
                                .autocorrectionDisabled()
                        }
                        
                        HStack {
                            Text("Hiện tại: ")
                                .font(.system(size: 20))
                                .frame(width: 100, alignment: .leading)
                            
                            TextField("hiện tại", value: $viewModel.currentAmount, format: .number)
                                .textFieldStyle(DefaultTextFieldStyle())
                                .font(.system(size: 20))
                                .autocorrectionDisabled()
                        }
                        
                        HStack {
                            Text("Mục tiêu: ")
                                .font(.system(size: 20))
                                .frame(width: 100, alignment: .leading)
                            
                            TextField("mục tiêu", value: $viewModel.amount, format: .number)
                                .font(.system(size: 20))
                        }
                        
                    }
                    .listRowBackground(Color.white.opacity(0.8))
                    
                    Section {
                        DatePicker("Ngày bắt đầu:", selection: $viewModel.dateStart, displayedComponents: .date)
                            .font(.system(size: 20))
                    }
                    .listRowBackground(Color.white.opacity(0.8))
                    
                    Section {
                        DatePicker("Ngày ước mơ:", selection: $viewModel.dateExpect, displayedComponents: .date)
                            .font(.system(size: 20))
                    }
                    
                    LabeledContent("Mỗi ngày", value: ((viewModel.amount - viewModel.currentAmount)/Double(viewModel.daysDifference())).rounded(), format: .number)
                        .font(.system(size: 20))
                    
                    .listRowBackground(Color.white.opacity(0.8))
                }
                .scrollDisabled(true)
                .tint(.pink)
                .frame(height: 450)
                .background(.gray.opacity(0.2))
                .scrollContentBackground(.hidden)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 15)
                .padding()
                
                Spacer()
                
                ButtonAdd(title: "Lưu") {
                    viewModel.save()
                    if viewModel.canSave {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddDream()
}
