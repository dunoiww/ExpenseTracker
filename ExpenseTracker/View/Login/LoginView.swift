//
//  LoginView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 14/09/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
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
                    
                    VStack {
                        Image("logoLogin")
                        
                        Text("Welcome Back!")
                            .font(.system(size: 32))
                            .bold()
                    }
                    
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
                        
                        SecureField("Password", text: $viewModel.password)
                            .font(.system(size: 25))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("bgLog1"), Color("bgLog3")]), startPoint: .trailing, endPoint: .leading), lineWidth: 2)
                            )
                        
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    ButtonLog(title: "LOGIN", action: viewModel.login)
                        .padding()
                    
                    VStack {
                        NavigationLink("Forgotten Password?", destination: RegisterView())
                            .foregroundColor(.secondary)
                        NavigationLink("Or Create a New Account", destination: RegisterView())
                            .foregroundColor(.secondary)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
