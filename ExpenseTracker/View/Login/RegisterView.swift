//
//  RegisterView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
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
                
                Text("Create Account!")
                    .font(.system(size: 32))
                    .bold()
                
                Spacer()
                    .frame(height: 60)
                
                VStack(spacing: 16) {
                    TextField("Username", text: $viewModel.username)
                        .font(.system(size: 25))
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color("bgLog1"), Color("bgLog3")]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                        )
                    
                    TextField("Email", text: $viewModel.email)
                        .font(.system(size: 25))
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color("bgLog1"), Color("bgLog3")]), startPoint: .trailing, endPoint: .leading), lineWidth: 2)
                        )
                    
                    SecureField("Password", text: $viewModel.password)
                        .font(.system(size: 25))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color("bgLog1"), Color("bgLog3")]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                        )
                    
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                ButtonLog(title: "SIGN UP", action: viewModel.createAccount)
                    .padding()
            }
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
