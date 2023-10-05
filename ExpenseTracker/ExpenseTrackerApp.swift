//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 14/09/2023.
//

import SwiftUI
import FirebaseCore

@main
struct ExpenseTrackerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
