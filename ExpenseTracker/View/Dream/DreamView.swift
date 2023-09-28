//
//  DreamView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI
import SwiftUICharts

struct DreamView: View {
    @StateObject var viewModel = DreamViewViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                Text("The List of your Dream!")
                    .font(.title)
                    .padding()
                
                ForEach(viewModel.dreamGoalList) { dream in
                    NavigationLink {
                        DreamDetailView(dreamGoal: dream)
                    } label: {
                        VStack {
                            DreamGoalRow(dreamgoal: dream)
                        }
                        .padding(.horizontal)
                    }
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
                    Text("Dream Goal")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .bold()
                }
            }
        }
    }
}

struct DreamView_Previews: PreviewProvider {
    static var previews: some View {
        DreamView()
    }
}
