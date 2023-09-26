//
//  QRView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI
import CardStack
import SwiftUICharts

struct QRView: View {
    @StateObject var viewModel = QRViewViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                CardStack(viewModel.creditList) { card in
                    ZStack {
                        card.backImage
                            .resizable()
                            .scaledToFit()
                            .onTapGesture {
                                viewModel.qrSelected = card.id
                            }
                        
                        VStack {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    Text("Current balance")
                                        .font(.system(size: 18))
                                        .foregroundColor(.gray)
                                    
                                    Text(card.amount, format: .currency(code: "VND"))
                                        .font(.system(size: 25))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.pink)
                                }
                                .offset(x: 10, y: 20)
                                
                                Spacer()
                                
                                card.bankLogo
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            }
                            .padding()
                            
                            Spacer()
                                .frame(height: 100)
                        }
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Spacer()
                                Text(card.numID)
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.pink)
                            }
                            .offset(x: 10, y: -10)
                            
                            Spacer()
                        }
                        .padding()
                        
                    }
                    .frame(height: 220)
                    .shadow(color: Color.primary.opacity(0.2), radius: 5, x: 0, y: 10)
                    
                }
                .padding()
                
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            viewModel.showPhotoLibrary.toggle()
                        } label: {
                            Text("Add your QR")
                        }
                    }
                    .padding(.horizontal)
                    .offset(y: 20)
                    
                    CardView {
                        ZStack {
                            VStack {
                                viewModel.creditList[viewModel.qrSelected - 1].bankLogo
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 60)
                                
                                if let image = viewModel.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                } else {
                                    Image("templateQRCode")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                        .onTapGesture {
                                            viewModel.showPhotoLibrary.toggle()
                                        }
                                }
                                
                                
                                Text(viewModel.creditList[viewModel.qrSelected - 1].name)
                                    .font(.title)
                                Text(viewModel.creditList[viewModel.qrSelected - 1].bank)
                                    .font(.title)
                            }
                            .frame(height: 350)
                        }
                    }
                    .padding()
                }
            }
            .background(Color("Background"))
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.blue, .primary)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("QR Wallet")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .bold()
                }
            }
            .sheet(isPresented: $viewModel.showPhotoLibrary) {
                ImagePicker(image: $viewModel.image)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
