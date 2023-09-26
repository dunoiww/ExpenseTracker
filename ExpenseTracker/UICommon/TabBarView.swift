//
//  TabBarView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectTab = 0
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 397, height: 54)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.49, green: 0.92, blue: 0.95), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.51, green: 0.64, blue: 0.83), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 0.99, y: 0)
                    )
                )
                .cornerRadius(15)
            
            HStack {
                HStack(alignment: .center) {
                    Button {
                        
                    } label: {
                        Image(systemName: "house")
                            .padding()
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "creditcard")
                            .padding(.leading, 30)
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                }
                Spacer()
                
                ZStack {
                    Image("Ellipse")
                        .offset(y: -25)
                        .clipShape(Rectangle().offset(y: 6))
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 50, height: 50)
                        .offset(y: -20)
                        .foregroundColor(Color("btnPlus"))
                    
                    Image(systemName: "plus")
                        .offset(y: -20)
                        .font(.system(size: 25))
                        .foregroundColor(.blue)
                }
                
                
                Spacer()
                
                HStack(alignment: .center) {
                    Button {
                        
                    } label: {
                        Image(systemName: "banknote")
                            .padding(.trailing, 30)
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape")
                            .padding()
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
