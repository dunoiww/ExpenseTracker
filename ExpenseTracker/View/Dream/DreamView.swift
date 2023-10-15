//
//  DreamView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 15/09/2023.
//

import SwiftUI
import SwiftUICharts
import FirebaseFirestoreSwift

struct DreamView: View {
    @StateObject var viewModel = DreamViewViewModel()
    @FirestoreQuery var dreams: [DreamGoal]
    @EnvironmentObject var currencyManager: CurrencyManager
    
    init(userId: String) {
        self._dreams = FirestoreQuery(collectionPath: "users/\(userId)/dreams")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Danh sách ước mơ của bạn!")
                    .font(.title)
                    .padding()
                List {
                    ForEach(Array(viewModel.groupDreamByMonth(dreams: dreams)), id: \.key) { state, Dreams in
                        Section {
                            ForEach(Dreams) { Dream in
                                NavigationLink {
                                    DreamDetailView(dreamGoal: Dream)
                                } label: {
                                    Text(Dream.dream)
                                }
                            }
                        } header: {
                            Text(state)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(.white)
                .cornerRadius(20)
                .padding()
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 50)
                    .foregroundColor(Color("Background"))
            }
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.blue, .primary)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Ước Mơ")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .bold()
                }
            }
            .background(Color("Background"))
        }
    }
}

struct DreamView_Previews: PreviewProvider {
    static var previews: some View {
        DreamView(userId: "rjAHDPqtNpTzMQ7UK5acmnRrOAH3")
            .environmentObject(CurrencyManager())
    }
}
