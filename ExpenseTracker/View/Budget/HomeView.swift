//
//  HomeView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI
import SwiftUICharts

struct HomeView: View {
    @StateObject var viewModel = HomeViewViewModel()
    
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
//                    Text("Overview")
//                        .foregroundColor(.black)
//                        .font(.title2)
//                        .bold()
                    
                    CardView {
                        VStack {
                            ChartLabel("100000vnd", type: .title)
                            LineChart()
                            
                            HStack {
                                VStack {
                                    Text("Thu nhập")
                                        .foregroundColor(.green)
                                        .fontWeight(.bold)
                                    
                                    Text("+đ1000")
                                        .foregroundColor(.green)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("Chi tiêu")
                                        .foregroundColor(.red)
                                        .fontWeight(.bold)
                                    Text("-đ2000")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.horizontal, 50)
                        }
                    }
                    .data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: Color.white, foregroundColor: ColorGradient(Color("Chart").opacity(0.4), Color("Chart"))))
                    .frame(height: 250)
                    
                    RecentTransactionList()
                    
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
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
