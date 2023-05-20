//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Hasan Al Mamun on 20/5/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TrasnsactionListViewModel()
      
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
