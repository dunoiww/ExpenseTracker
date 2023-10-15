//
//  AbouUsView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 11/10/2023.
//

import SwiftUI

struct AbouUsView: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("Introduction about Expense Tracker")
                        .font(.system(size: 20))
                        .bold()
                        .padding()
                    
                    Text("In today's fast-paced and financially challenging world, keeping track of our expenses is more important than ever. Whether it's managing personal finances, staying on top of business expenses, or simply trying to budget effectively, having a reliable and user-friendly expense tracking tool can make a significant difference. This is where the Expense Tracker App comes into play.\n")
                    
                    Text("The Expense Tracker App is a powerful and intuitive mobile application designed to help individuals and businesses track and manage their expenses effortlessly. With its user-friendly interface and robust features, the app simplifies the process of recording, categorizing, and analyzing expenditures, giving users a clearer understanding of their financial habits and enabling them to make informed decisions.\n")
                    
                    Text("Gone are the days of dealing with stacks of receipts and manually entering expenses into spreadsheets. The Expense Tracker App leverages cutting-edge technology to streamline the expense tracking process. Users can effortlessly capture receipts using their smartphone's camera, automatically extract relevant information, and categorize expenses with a few taps. This not only saves time but also eliminates the risk of errors and ensures accurate and up-to-date financial records.\n")
                    
                    Text("One of the key strengths of the Expense Tracker App is its versatility. It caters to a wide range of users, from individuals looking to stay on top of their personal finances to small business owners seeking to monitor expenses and simplify tax preparation. The app provides customizable expense categories, allowing users to tailor the tracking system to their specific needs. It also offers comprehensive reporting and analysis features, presenting users with clear visualizations and insights into their spending patterns, trends, and budget adherence.\n")
                    
                    Text("Security and privacy are paramount when it comes to managing financial information. The Expense Tracker App prioritizes the protection of user data through state-of-the-art security measures, including encryption and secure cloud storage. Users can have peace of mind knowing that their financial information is safe and confidential.\n")
                    
                    Text("In conclusion, the Expense Tracker App is a reliable and indispensable tool for anyone seeking to gain control over their expenses. With its user-friendly interface, powerful features, and emphasis on security, the app empowers individuals and businesses to track their spending, make informed financial decisions, and ultimately achieve their financial goals. Whether you're a budget-conscious individual or a business owner, the Expense Tracker App is your go-to solution for efficient expense management.\n")
                }
                .padding()
                
                Text("Design and code by Ngo Nam")
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 50)
                    .foregroundColor(Color("Background"))
            }
        }
        .background(Color("Background"))
    }
}

#Preview {
    AbouUsView()
}
