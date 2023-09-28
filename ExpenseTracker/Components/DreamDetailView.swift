//
//  DreamDetailView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 27/09/2023.
//

import SwiftUI

struct DreamDetailView: View {
    @ObservedObject var viewModel = DreamViewViewModel()
    let dreamGoal: DreamGoal
    
    var body: some View {
            ScrollView {
                NavigationLink {
                    AddMoneyDream()
                } label: {
                    Image("piggy")
                        .resizable()
                        .scaledToFit()
                }
                
                VStack {
                    ZStack {
                        ProgressBar(value: Float(dreamGoal.currentMoney / dreamGoal.expectedMoney))
                        
                        Text("\(Int(Float(dreamGoal.currentMoney / dreamGoal.expectedMoney) * 100))% completed")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                
                VStack {
                    HStack {
                        Text("Money: ")
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
                        Text("Goal: ")
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
                        Text("Start Day: ")
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
                        Text("Expected Day: ")
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
