//
//  AddBudget.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 21/09/2023.
//

import SwiftUI
import SwiftUIFontIcon
import FirebaseFirestoreSwift

struct AddBudget: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var currencyManager: CurrencyManager
    @StateObject var viewModel = AddBudgetViewModel()
    @Namespace var animation
    @FirestoreQuery var creditCards: [CreditCard]
    
    init(userId: String) {
        self._creditCards = FirestoreQuery(collectionPath: "users/\(userId)/creditCards")
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    
                    Text("Thêm giao dịch")
                        .font(.title)
                        .bold()
                        .padding()
                    HStack {
                        CustomSegmentedControl()
                    }
                    
                    if viewModel.tabName == TransactionType.expense {
                        addTransaction(type: "Expense")
                    } else {
                        addTransaction(type: "Income")
                    }
                    
                    HStack {
                        Text("")
                        Spacer()
                        
                        
                    }
                    
                    HStack {
                        Text("Phương thức: ")
                            .font(.title2)
                            .bold().opacity(0.7)
                        Spacer()
                        Picker("Phương thức thanh toán", selection: $viewModel.typePurchase) {
                            ForEach(viewModel.typePurchases, id: \.self) {
                                Text($0)
                            }
                        }
                        .tint(.black)
                        .font(.system(size: 20))
                    }
                    .padding(.leading, 16)
                    
                    if viewModel.typePurchase == "Thẻ" {
                        showListCards(creditCards: creditCards)
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    
                    ButtonAdd(title: "Lưu") {
                        Task {
                            do {
                                try await viewModel.save()
                                dismiss()
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                    
                }
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("Transaction"), .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
    }
    @ViewBuilder
    func CustomSegmentedControl() -> some View {
        ForEach([TransactionType.expense, TransactionType.income], id: \.rawValue) { tab in
            Text(tab.rawValue == "Expense" ? "Chi tiêu" : "Thu nhập")
                .fontWeight(.semibold)
                .foregroundColor(viewModel.tabName == tab ? .white : .black)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background {
                    if viewModel.tabName == tab {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color("tab1"), Color("tab2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        viewModel.tabName = tab
                    }
                }
        }
    }
    
    //MARK: detail of add
    @ViewBuilder
    func addTransaction(type: String) -> some View {
        VStack {
            HStack(spacing: 20) {
                Text("Tiêu đề")
                    .font(.title2)
                    .bold().opacity(0.7)
                    .padding(.trailing, 20)
                    .frame(width: 100, alignment: .leading)
                TextField("tiêu đề", text: $viewModel.title)
                    .font(.system(size: 20))
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding()
            }
            .padding(.leading, 16)
            
            HStack {
                DatePicker("Ngày", selection: $viewModel.selectedDate, displayedComponents: .date)
                    .font(.title2)
                    .bold().opacity(0.7)
                    .datePickerStyle(.compact)
                    .environment(\.locale, vietnameseLocale)
                    .padding(.horizontal)
            }
            
            HStack(spacing: 20) {
                Text("Ghi chú")
                    .font(.title2)
                    .bold().opacity(0.7)
                    .padding(.trailing, 20)
                    .frame(width: 100, alignment: .leading)
                TextField("ghi chú", text: $viewModel.note)
                    .font(.system(size: 20))
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding()
            }
            .padding(.leading, 16)
            
            HStack(spacing: 20) {
                Text("Giá trị")
                    .font(.title2)
                    .bold().opacity(0.7)
                    .padding(.trailing, 15)
                    .frame(width: 110, alignment: .leading)
                
                TextField("Giá trị", value: $viewModel.amount, format: .number)
                    .font(.system(size: 20))
            }
            .padding(.leading, 16)
            
            gridCategory(type: type)
        }
    }
    
    @ViewBuilder
    func gridCategory(type: String) -> some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15) {
                ForEach(Category.categories.filter{$0.type == type}, id: \.id) { category in
                    Button {
                        viewModel.isChoose = category
                    } label: {
                        VStack {
                            FontIcon.text(.awesome5Solid(code: category.icon), fontsize: 35, color: viewModel.isChoose == category ? .red : .black)
                                .opacity(viewModel.isChoose == category ? 1 : 0.7)
                                .frame(width: 100, height: 70)
                            
                            
                            Text(category.name)
                                .font(.system(size: 15))
                                .foregroundColor(viewModel.isChoose == category ? .red : .secondary)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(viewModel.isChoose == category ? .red : Color.black, lineWidth: 1)
                        )
                        .background(viewModel.isChoose == category ? .yellow.opacity(0.4) : .yellow.opacity(0))
                        .cornerRadius(10)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func showListCards(creditCards: [CreditCard]) -> some View {
        Text("Danh sách thẻ đang có của bạn: ")
            .font(.system(size: 20))
            .padding()
        ForEach(creditCards) { credit in
            CreditBudgetRow(creditCard: credit)
                .onTapGesture {
                    viewModel.chooseBank = credit
                }
                .foregroundColor(viewModel.chooseBank == credit ? .pink : .black)
        }
        .padding(.horizontal)
    }
}

#Preview {
    AddBudget(userId: "rjAHDPqtNpTzMQ7UK5acmnRrOAH3")
        .environmentObject(CurrencyManager())
}
