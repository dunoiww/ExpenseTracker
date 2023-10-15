//
//  CreditManager.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 06/10/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

class CreditManager {
    init() {}
    
    static let shared = CreditManager()
    
    func addCredit(id: String, userId: String, bank: String, name: String, numId: String, amount: Double, qrImage: String) async throws {
        
        let newCredit = CreditCard(id: id, bank: bank, name: name, numID: numId, amount: amount, qrImage: qrImage)
        
        let db = Firestore.firestore()
        try await db.collection("users")
            .document(userId)
            .collection("creditCards")
            .document(id)
            .setData(newCredit.asDictionary())
    }
    
    func updateAmount(userId: String, id: String, amount: Double) {
        var creditCard: CreditCard?
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("creditCards")
            .document(id)
            .getDocument { snapshot, error in
                guard let data = snapshot?.data(), error == nil else { return }
                
                DispatchQueue.main.async {
                    let creditCardtemp = CreditCard(id: data["id"] as? String ?? "",
                                            bank: data["bank"] as? String ?? "",
                                            name: data["name"] as? String ?? "",
                                            numID: data["numID"] as? String ?? "",
                                            amount: data["amount"] as? Double ?? 0.0,
                                            qrImage: data["qrImage"] as? String ?? "")
                    
                    creditCard = creditCardtemp
                    creditCard?.amount += amount
                    
                    
                    db.collection("users")
                        .document(userId)
                        .collection("creditCards")
                        .document(id)
                        .setData(creditCard.asDictionary())
                }
            }
        
        
    }
    
    func saveQrImage(id: String, image: UIImage?) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }
        
        let storage = Storage.storage()
        let storageRef = storage.reference(withPath: userId)
        
        storageRef.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                print(err)
                return
            }
            
            storageRef.downloadURL { url, err in
                if let err = err {
                    print(err)
                    return
                }
                let db = Firestore.firestore()
                db.collection("users")
                    .document(userId)
                    .collection("creditCards")
                    .document(id)
                    .updateData(["qrImage": url?.absoluteString ?? ""]) { err in
                        if let err = err {
                            print(err)
                        }
                    }
            }
        }
    }
}
