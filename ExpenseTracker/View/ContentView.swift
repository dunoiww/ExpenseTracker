//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 14/09/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isLogin, !viewModel.currentUser.isEmpty {
            mainView()
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    func mainView() -> some View {
        ZStack {
            
            if viewModel.selectedTab == 0 {
                HomeView()
            }
            else if viewModel.selectedTab == 1 {
                QRView(userId: "rjAHDPqtNpTzMQ7UK5acmnRrOAH3")
            }
            else if viewModel.selectedTab == 2 {
                DreamView(userId: "rjAHDPqtNpTzMQ7UK5acmnRrOAH3")
            }
            else if viewModel.selectedTab == 3 {
                InfoView()
            }
            
            VStack {
                Spacer()
                ZStack {
                    Image("dungi")
                        .frame(width: UIScreen.main.bounds.width, height: 65)
                        .offset(x: 3)
                        .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 2)
                    
                    HStack {
                        HStack(alignment: .center) {
                            Button {
                                viewModel.selectedTab = 0
                            } label: {
                                Image(systemName: "house")
                                    .padding(.leading, 35)
                                    .padding(.bottom, 10)
                                    .font(.system(size: 25))
                                    .foregroundColor(viewModel.selectedTab == 0 ? .blue : .black)
                            }
                            
                            Button {
                                viewModel.selectedTab = 1
                            } label: {
                                Image(systemName: "creditcard")
                                    .padding(.leading, 30)
                                    .padding(.bottom, 10)
                                    .font(.system(size: 25))
                                    .foregroundColor(viewModel.selectedTab == 1 ? .blue : .black)
                            }
                        }
                        Spacer()
                        
                        Button {
                            if viewModel.selectedTab == 0 {
                                viewModel.showAddBudget.toggle()
                            }
                            else if viewModel.selectedTab == 1 {
                                viewModel.showAddCrediCard.toggle()
                            }
                            else if viewModel.selectedTab == 2 {
                                viewModel.showAddDream.toggle()
                            }
                            else if viewModel.selectedTab == 3 {
                                viewModel.showSetting.toggle()
                            }
                            
                        } label: {
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 58)
                                    .frame(width: 58, height: 58)
                                    .foregroundColor(Color("btnPlus"))

                                Image(systemName: "plus")
                                    .font(.system(size: 25))
                                    .foregroundColor(.blue)
                            }
                        }
                        .offset(y: -30)
                        
                        
                        Spacer()
                        
                        HStack(alignment: .center) {
                            Button {
                                viewModel.selectedTab = 2
                            } label: {
                                Image(systemName: "banknote")
                                    .padding(.trailing, 30)
                                    .padding(.bottom, 10)
                                    .font(.system(size: 25))
                                    .foregroundColor(viewModel.selectedTab == 2 ? .blue : .black)
                            }
                            
                            Button {
                                viewModel.selectedTab = 3
                            } label: {
                                Image(systemName: "gearshape")
                                    .padding(.trailing, 30)
                                    .padding(.bottom, 10)
                                    .font(.system(size: 25))
                                    .foregroundColor(viewModel.selectedTab == 3 ? .blue : .black)
                            }
                        }
                    }
                }
            }
            .offset(y: 42)
        }
        .background(Color("Background"))
        .sheet(isPresented: $viewModel.showAddBudget) {
            AddBudget(userId: "rjAHDPqtNpTzMQ7UK5acmnRrOAH3")
        }
        .sheet(isPresented: $viewModel.showAddCrediCard) {
            AddCreditCard()
        }
        .sheet(isPresented: $viewModel.showAddDream) {
            AddDream()
                .presentationDetents([.large, .medium, .fraction(0.5)])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
