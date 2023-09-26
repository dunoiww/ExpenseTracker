//
//  ButtonLog.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 14/09/2023.
//

import SwiftUI

struct ButtonLog: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 229, height: 54)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.59, green: 0.59, blue: 0.75), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.53, green: 0.66, blue: 0.91), location: 0.48),
                                Gradient.Stop(color: Color(red: 0.57, green: 0.92, blue: 0.89), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0, y: 0),
                            endPoint: UnitPoint(x: 1, y: 0)
                        )
                    )
                    .cornerRadius(20)
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 36))
            }
        }
    }
}

struct ButtonLog_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLog(title: "Login", action: {
            
        })
    }
}
