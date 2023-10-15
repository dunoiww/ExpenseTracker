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
    
    @StateObject var currencyManager = CurrencyManager()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(currencyManager)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

struct AlertPresenter: UIViewControllerRepresentable {
    var title: String
    var message: String
    var completionHandler: (() -> Void)? = nil
    
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if context.coordinator.alertController == nil {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                completionHandler?()
            }
            alertController.addAction(okAction)
            context.coordinator.alertController = alertController
            uiViewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator {
        var alertController: UIAlertController?
    }
}
