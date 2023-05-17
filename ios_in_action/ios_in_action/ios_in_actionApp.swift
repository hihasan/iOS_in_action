//
//  ios_in_actionApp.swift
//  ios_in_action
//
//  Created by Hasan Al Mamun on 11/5/23.
//

import SwiftUI

@main
struct ios_in_actionApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView().tabItem{
                    Label("Content View", systemImage: "gear")
                }
                
                PersonalPortfolioView().tabItem{
                    Label("Person Details", systemImage: "person")
                }
                
                PickerView().tabItem(){
                    Label("Shape View", systemImage: "book")
                }
                
            }
            
        }
    }
}
