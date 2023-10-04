//
//  ForgetPasswordView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 02/10/2023.
//

import SwiftUI

struct ForgetPasswordView: View {
    @StateObject var viewModel = ForgetPasswordViewViewModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                Color("bgLog1"),
                Color("bgLog2"),
                Color("bgLog3")
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: 40)
                
                Image("logoLogin")
                
                Text("Đừng lo lắng, hãy điền email của bạn!")
                    .font(.system(size: 32))
                    .bold()
                
                Spacer()
                    .frame(height: 100)
                
                VStack(spacing: 16) {
                    
                    TextField("Email", text: $viewModel.email)
                        .font(.system(size: 25))
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color("bgLog1"), Color("bgLog3")]), startPoint: .trailing, endPoint: .leading), lineWidth: 2)
                        )
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Button("Reset password") {
                    Task {
                        do {
                            try await viewModel.forget()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    ForgetPasswordView()
}
