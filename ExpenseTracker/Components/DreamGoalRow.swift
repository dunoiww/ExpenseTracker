//
//  DreamGoalRow.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 26/09/2023.
//

import SwiftUI

struct DreamGoalRow: View {
    var dreamgoal: DreamGoal
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 50)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.57, green: 0.78, blue: 0.89), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.7, green: 0.76, blue: 0.79), location: 1.00),
                            Gradient.Stop(color: Color(red: 0.57, green: 0.78, blue: 0.89).opacity(0), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 1, y: 0)
                    )
                )
                .cornerRadius(20)
            
            HStack {
                Text(dreamgoal.dream)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(DateFormatter.vietnameseDateFormat.string(from: dreamgoal.dateExpectedParsed))
                    .foregroundColor(.black)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
            .padding()
        }
    }
}

#Preview {
    DreamGoalRow(dreamgoal: dreamGoalPreviewData)
}
