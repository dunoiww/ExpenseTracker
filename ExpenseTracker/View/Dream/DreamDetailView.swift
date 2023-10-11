//
//  DreamDetailView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 27/09/2023.
//

import SwiftUI

struct DreamDetailView: View {
    @StateObject var viewModel = DreamDetailViewViewModel()
    let dreamGoal: DreamGoal
    
    var body: some View {
            ScrollView {
                NavigationLink {
                    AddMoneyDream(dream: dreamGoal)
                } label: {
                    Image("piggy")
                        .resizable()
                        .scaledToFit()
                }
                
                VStack {
                    ZStack {
                        ProgressBar(value: Float(dreamGoal.currentMoney / dreamGoal.expectedMoney))
                        
                        Text("\(Int(Float(dreamGoal.currentMoney / dreamGoal.expectedMoney) * 100))% Hoàn thành")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                VStack {
                    HStack {
                        Text("Hiện tại: ")
                            .font(.system(size: 26))
                            .fontWeight(.medium)
                        Spacer()
                        Text(dreamGoal.currentMoney, format: .currency(code: "VND"))
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 1)
                    
                    HStack {
                        Text("Mục tiêu: ")
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                        Spacer()
                        Text(dreamGoal.expectedMoney, format: .currency(code: "VND"))
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 1)
                    
                    HStack {
                        Text("Ngày bắt đầu: ")
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                        Spacer()
                        Text(DateFormatter.vietnameseDateFormat.string(from: dreamGoal.dateStartParsed))
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 1)
                    
                    HStack {
                        Text("Ngày kết thúc: ")
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                        Spacer()
                        Text(DateFormatter.vietnameseDateFormat.string(from: dreamGoal.dateExpectedParsed))
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 1)
                }
            }
            .background(Color("Background"))
            .navigationTitle(dreamGoal.dream)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if dreamGoal.currentMoney >= dreamGoal.expectedMoney {
                    viewModel.showingAlert.toggle()
                }
            }
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(
                    title: Text("Thật tuyệt"),
                    message: Text("Ước mơ này của bạn đã được hoàn thành!"),
                    dismissButton: .default (Text("Tuyệt"))
                )
            }
        
    }
}

struct ProgressBar: View {
    var value: Float

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(10)
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    NavigationView {
        DreamDetailView(dreamGoal: dreamGoalPreviewData)
    }
}
