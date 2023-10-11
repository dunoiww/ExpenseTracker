//
//  DreamViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 26/09/2023.
//

import Foundation

typealias DreamGroup = [String : [DreamGoal]]
class DreamViewViewModel: ObservableObject {
    init() {}
    
    var dreamGoalList = dreamGoalListPreviewData
    
    func groupDreamByMonth(dreams: [DreamGoal]) -> DreamGroup {
        guard !dreams.isEmpty else { return [:] }
        
        let groupDreams = DreamGroup(grouping: dreams) { dream -> String in
            return dream.isFinish == 1 ? "Hoàn thành" : "Chưa hoàn thành"
        }
        
        return groupDreams
    }
}
