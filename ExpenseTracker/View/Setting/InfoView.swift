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
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.blue)
                        .frame(width: 128, height: 128)
                }
                VStack {
                    VStack {
                        Text("Profile")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .offset(x: 15, y: 15)
                        
                        CardView {
                            VStack {
                                HStack {
                                    Text("Name: ")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text("Ngo nam")
                                        .font(.system(size: 20))
                                }
                                
                                Divider()
                                
                                HStack {
                                    Text("Email: ")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text("namngo102003@gmail.com")
                                        .font(.system(size: 20))
                                }
                            }
                            .padding()
                        }
                        .padding()
                        
                        
                    }
                    VStack {
                        Text("Data")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .offset(x: 15, y: 15)
                        
                        CardView {
                            VStack {
                                HStack {
                                    Text("Statistic")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Divider()
                                
                                HStack {
                                    Text("Search")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Divider()
                                
                                HStack {
                                    Text("Export data")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                        }
                        .padding()
                        
                        
                    }
                    VStack {
                        Text("More info")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .offset(x: 15, y: 15)
                        
                        CardView {
                            VStack {
                                NavigationLink {
                                    
                                } label: {
                                    HStack {
                                        Text("Help")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                    }
                                    .foregroundColor(.primary)
                                }
                                
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Divider()
                                
                                NavigationLink {
                                    
                                } label: {
                                    HStack {
                                        Text("About")
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
                                } label: {
                                    HStack {
                                        Text("Setting")
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
                    
                    ButtonLog(title: "Log out") {
                        viewModel.logout()
                    }
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 50)
                        .foregroundColor(Color("Background"))
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Background"))
                .toolbar {
                    ToolbarItem {
                        Image(systemName: "bell.badge")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.blue, .primary)
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Info")
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                            .bold()
                    }
                }
            }
        }
        
       
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
