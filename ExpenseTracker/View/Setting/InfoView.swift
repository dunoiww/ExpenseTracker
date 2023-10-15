//
//  InfoView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI
import SwiftUICharts

struct InfoView: View {
    @StateObject var viewModel = InfoViewViewModel()
    @EnvironmentObject var currencyManager: CurrencyManager
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.blue)
                            .frame(width: 128, height: 128)
                    }
                    VStack {
                        if let user = viewModel.user {
                            info(user: user)
                        } else {
                            HStack {
                                Text("Đang tải dữ liệu người dùng...")
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal)
                                
                                ProgressView()
                            }
                        }
                        
                        //MARK: Data section
                        
                        VStack {
                            Text("Dữ liệu")
                                .font(.system(size: 15))
                                .fontWeight(.thin)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .offset(x: 22, y: 22)
                            
                            CardView {
                                VStack {
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack {
                                            Text("Thống kê")
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                        }
                                        .foregroundColor(.primary)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Divider()
                                    
                                    NavigationLink {
                                        SearchView()
                                    } label: {
                                        HStack {
                                            Text("Tìm kiếm")
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                        }
                                        .foregroundColor(.primary)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                }
                                .padding()
                            }
                            .padding()
                            
                            
                        }
                        
                        //MARK: Info section
                        
                        VStack {
                            Text("Thông tin khác")
                                .font(.system(size: 15))
                                .fontWeight(.thin)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .offset(x: 22, y: 22)
                            
                            CardView {
                                VStack {
                                    NavigationLink {
                                        HelpView()
                                    } label: {
                                        HStack {
                                            Text("Trợ giúp")
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                        }
                                        .foregroundColor(.primary)
                                    }
                                    
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Divider()
                                    
                                    NavigationLink {
                                        AbouUsView()
                                    } label: {
                                        HStack {
                                            Text("Về chúng tôi")
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                        }
                                        .foregroundColor(.primary)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Divider()
                                    
                                    NavigationLink {
                                        SettingView()
                                            .environmentObject(currencyManager)
                                    } label: {
                                        HStack {
                                            Text("Cài đặt")
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                        }
                                        .foregroundColor(.primary)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding()
                            }
                            .padding()
                            
                        }
                        
                        //MARK: Button logout
                        
                        ButtonLog(title: "Đăng xuất") {
                            viewModel.showAlert.toggle()
                        }
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 50)
                            .foregroundColor(Color("Background"))
                        
                        
                    }
                }
                .task {
                    do {
                        try await viewModel.fetchUser()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Thông tin")
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                            .bold()
                    }
                }
                
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text("Bạn muốn thoát ứng dụng?"),
                        primaryButton: .default (
                            Text("Huỷ")
                        ),
                        secondaryButton: .destructive(
                            Text("Thoát"),
                            action: viewModel.logout
                        )
                    )
                }
            }
            .background(Color("Background"))
        }
        
        
    }
    
    //MARK: user data
    @ViewBuilder
    func info(user: User) -> some View {
        VStack {
            Text("Profile")
                .font(.system(size: 15))
                .fontWeight(.thin)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .offset(x: 22, y: 22)
            
            CardView {
                VStack {
                    HStack {
                        Text("Tên: ")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        Spacer()
                        Text(user.name)
                            .font(.system(size: 20))
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Email: ")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        Spacer()
                        Text(user.email)
                            .font(.system(size: 20))
                    }
                }
                .padding()
            }
            .padding()
            
            
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environmentObject(CurrencyManager())
    }
}
