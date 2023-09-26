//
//  DreamView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI

struct DreamView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
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
