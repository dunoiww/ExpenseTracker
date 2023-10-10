//
//  AddCrediCardViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 26/09/2023.
//

import Foundation
import FirebaseAuth
import SwiftUI

class AddCrediCardViewModel: ObservableObject {
    init() {}
    
    @Published var name = ""
    @Published var amount = 0.0
    @Published var numId = ""
    @Published var isChoose: Bank? = nil
    @Published var showPhotoLibrary = false
    @Published var image: UIImage?
    @Published var message = ""
    
    func save() async throws {
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        guard canSave else { return }
        
        let newId = UUID().uuidString
        
        try await CreditManager.shared.addCredit(id: newId, userId: userId, bank: isChoose?.name ?? "", name: name, numId: numId, amount: amount, qrImage: "")
        
        CreditManager.shared.saveQrImage(id: newId, image: image)
    }
    
    var canSave: Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty &&
                !numId.trimmingCharacters(in: .whitespaces).isEmpty &&
                amount != 0.0 &&
                isChoose != nil &&
                image != nil else {
            return false
        }
        
        return true
    }
}
