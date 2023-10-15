//
//  HelpView.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 11/10/2023.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Bạn cần hỗ trợ gì?")
            Text("Hãy liên hệ với chúng tôi qua 080803021003 - MB")
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color("Background"))
    }
}

#Preview {
    HelpView()
}
