//
//  SettingView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI
import SwiftUICharts

struct SettingView: View {
    @StateObject var viewModel = SettingViewViewModel()
    @EnvironmentObject var currencyManager: CurrencyManager
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "dollarsign.square")
                    Text("Chuyển đổi tiền tệ")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.leading, 4)
                    Spacer()
                    Picker("Chọn tiền tệ", selection: $currencyManager.currentCurrency) {
                        ForEach(viewModel.currencies, id: \.self) {
                            Text($0)
                        }
                    }
                    .tint(.black)
                }
                
//                Divider()
//                
//                HStack {
//                    Image(systemName: "textformat")
//                    Text("Chuyển đổi ngôn ngữ")
//                        .font(.system(size: 20))
//                        .fontWeight(.semibold)
//                    Spacer()
//                    Image(systemName: "chevron.right")
//                }
            }
            .padding()
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .background(Color("Background"))
        .navigationTitle("Setting")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingView()
                .environmentObject(CurrencyManager())
        }
    }
}
