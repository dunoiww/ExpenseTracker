//
//  QRView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI
import CardStack
import SwiftUICharts
import FirebaseFirestoreSwift

struct QRView: View {
    @StateObject var viewModel = QRViewViewModel()
    @FirestoreQuery var credits: [CreditCard]
    
    init(userId: String) {
        self._credits = FirestoreQuery(collectionPath: "users/\(userId)/creditCards")
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                CardStack(credits) { card in
                    ZStack {
                        card.backImage
                            .resizable()
                            .scaledToFit()
                            .onTapGesture {
                                viewModel.qrSelected = card.numID
                            }
                        
                        VStack {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    Text("Số dư")
                                        .font(.system(size: 18))
                                        .foregroundColor(.gray)
                                        .italic()
                                    
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
                                HStack {
                                    Text("Số thẻ:")
                                        .font(.system(size: 18))
                                        .foregroundColor(.gray)
                                        .italic()
                                    Text(card.numID)
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.pink)
                                }
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
                    CardView {
                        ZStack {
                            VStack {
                                if let credit = credits.filter({$0.numID == viewModel.qrSelected}).first {
                                    credit.bankLogo
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 60)
                                    
                                    
                                    AsyncImage(url: URL(string: credit.qrImage)) { image in
                                        image
                                            .resizable()
                                            .frame(width: 200, height: 200)
                                            .scaledToFit()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    Text(credit.name)
                                        .font(.title)
                                    Text(credit.bank)
                                        .font(.title)
                                } else {
                                    
                                }
                                
                                
                            }
                            .frame(height: 350)
                        }
                    }
                    .padding()
                }
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 50)
                    .foregroundColor(Color("Background"))
            }
            .background(Color("Background"))
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.blue, .primary)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Thẻ ngân hàng")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .bold()
                }
            }
            
        }
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView(userId: "rjAHDPqtNpTzMQ7UK5acmnRrOAH3")
    }
}
