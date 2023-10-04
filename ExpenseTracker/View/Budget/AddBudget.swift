//
//  AddBudget.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 21/09/2023.
//

import SwiftUI
import SwiftUIFontIcon

struct AddBudget: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AddBudgetViewModel()
    @Namespace var animation
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Transaction"), .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
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
                    
                Spacer()
                
                ButtonAdd(title: "Lưu") {
                    viewModel.save()
                    dismiss()
                }
                
            }
        }
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
    
    @ViewBuilder
    func addTransaction(type: String) -> some View {
        VStack {
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
                TextField("Giá trị", value: $viewModel.amount, format: .currency(code: "VND"))
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
                    }
                }
            }
        }
    }
}

#Preview {
    AddBudget()
}
