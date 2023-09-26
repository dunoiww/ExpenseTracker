//
//  ButtonAdd.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 21/09/2023.
//

import SwiftUI

struct ButtonAdd: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 180, height: 50)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color("tab1"),
                                Color("tab2")
                            ]), startPoint: .topLeading, endPoint: .bottomTrailing
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

#Preview {
    ButtonAdd(title: "Save") {
        
    }
}
