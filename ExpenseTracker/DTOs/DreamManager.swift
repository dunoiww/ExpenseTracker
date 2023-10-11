//
//  DreamManager.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 10/10/2023.
//

import Foundation
import FirebaseFirestore

class DreamManager {
    init() {}
    static let shared = DreamManager()
    
    func addDream(userId: String, id: String, dream: String, currentAmount: Double, amount: Double, dateStart: String, dateExpect: String) {
        
        let newDream = DreamGoal(id: id, dream: dream, currentMoney: currentAmount, expectedMoney: amount, dateStart: dateStart, dateExpected: dateExpect, isFinish: 0)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("dreams")
            .document(id)
            .setData(newDream.asDictionary())
    }
    
    func addMoney(userId: String, amount: Double, dream: DreamGoal) {
        var newDream = dream
        newDream.currentMoney += amount
        
        if newDream.currentMoney >= newDream.expectedMoney {
            newDream.isFinish = 1   
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("dreams")
            .document(newDream.id)
            .setData(newDream.asDictionary())
    }
}
