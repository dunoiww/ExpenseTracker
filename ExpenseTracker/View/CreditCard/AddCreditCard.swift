//
//  AddCreditCard.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 21/09/2023.
//

import SwiftUI
import SwiftUICharts

struct AddCreditCard: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = AddCrediCardViewModel()
    var body: some View {
        ScrollView {
            VStack {
                Text("Add Credit Card")
                    .font(.title)
                    .bold()
                    .padding()
                
                VStack {
                    HStack(spacing: 20) {
                        Text("Tên chủ thẻ")
                            .font(.title2)
                            .bold().opacity(0.7)
                            .frame(width: 140, alignment: .leading)
                        TextField("tên của bạn", text: $viewModel.name)
                            .font(.system(size: 20))
                            .autocorrectionDisabled()
                    }
                    .padding(.leading, 16)
                    
                    HStack(spacing: 20) {
                        Text("Giá trị thẻ")
                            .font(.title2)
                            .bold().opacity(0.7)
                            .frame(width: 140, alignment: .leading)
                        TextField("Amount", value: $viewModel.amount, format: .number)
                            .font(.system(size: 20))
                    }
                    .padding(.leading, 16)
                    
                    HStack(spacing: 20) {
                        Text("Số thẻ")
                            .font(.title2)
                            .bold().opacity(0.7)
                            .frame(width: 140, alignment: .leading)
                        TextField("số thẻ", text: $viewModel.numId)
                            .font(.system(size: 20))
                    }
                    .padding(.leading, 16)
                    
                    VStack {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                            ForEach(Bank.banks, id: \.id) { bank in
                                Button {
                                    viewModel.isChoose = bank
                                } label: {
                                    VStack {
                                        bank.logo
                                            .resizable()
                                            .scaledToFit()
                                            .padding()
                                            .frame(width: 120, height: 80)
                                            
                                    }
                                    .background(viewModel.isChoose == bank ? .yellow.opacity(0.5) : .white.opacity(0)).cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(viewModel.isChoose == bank ? .blue : Color.black.opacity(0.5), lineWidth: 2)
                                    )
                                }
                            }
                        }
                        .padding()
                    }
                    
                    CardView {
                        if let image = viewModel.image {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 300, height: 300)
                                .scaledToFit()
                                .onTapGesture {
                                    viewModel.showPhotoLibrary.toggle()
                                }
                        } else {
                            Image("templateQRCode")
                                .resizable()
                                .onTapGesture {
                                    viewModel.showPhotoLibrary.toggle()
                                }
                        }
                    }
                    .frame(height: 350)
                    .padding()
                    
                    if !viewModel.canSave {
                        Text("Hãy điền đầy đủ và chính xác thông tin.")
                            .foregroundColor(.red)
                            .italic()
                    }
                    
                    ButtonAdd(title: "Lưu") {
                        Task {
                            do {
                                try await viewModel.save()
                                if viewModel.canSave {
                                    dismiss()
                                }
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                    
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("Transaction"), .white]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea())
        
        .fullScreenCover(isPresented: $viewModel.showPhotoLibrary) {
            ImagePicker(image: $viewModel.image)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    AddCreditCard()
}
