//
//  HomeView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI
import FirebaseFirestoreSwift
import SwiftUICharts

struct HomeView: View {
    @StateObject var viewModel = HomeViewViewModel()
    
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    if !viewModel.data.isEmpty {
                        let total = viewModel.data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(total.formatted(.currency(code: "VND")), type: .title, format: "%.0f₫")
                                LineChart()
                                
//                                HStack {
//                                    VStack {
//                                        Text("Thu nhập")
//                                            .foregroundColor(.green)
//                                            .fontWeight(.bold)
//                                        
//                                        Text("+đ1000")
//                                            .foregroundColor(.green)
//                                    }
//                                    
//                                    Spacer()
//                                    
//                                    VStack {
//                                        Text("Chi tiêu")
//                                            .foregroundColor(.red)
//                                            .fontWeight(.bold)
//                                        Text("-đ2000")
//                                            .foregroundColor(.red)
//                                    }
//                                }
//                                .padding(.horizontal, 50)
                            }
                        }
                        .data(viewModel.data)
//                        .data(demoData)
                        .chartStyle(ChartStyle(backgroundColor: Color.white, foregroundColor: ColorGradient(Color("Chart").opacity(0.4), Color("Chart"))))
                        .frame(height: 250)
                    } else {
                        CardView {
                            HStack {
                                ProgressView()
                                    .padding(.trailing, 20)
                                Text("Đang load dữ liệu...")
                            }
                        }
                        .frame(height: 250)
                    }
                    
                    RecentTransactionList(userId: viewModel.userId ?? "rjAHDPqtNpTzMQ7UK5acmnRrOAH3")
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 50)
                        .foregroundColor(Color("Background"))
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color("Background"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.blue, .primary)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Tổng quan")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .bold()
                }
            }
            .task {
                do {
                    viewModel.data = try await viewModel.accumulateTransactions()
                    //                    DispatchQueue.main.async {
                    //                        viewModel.total = viewModel.data.last?.1 ?? 0
                    //                    }
                } catch {
                    print(error)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
