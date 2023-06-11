//
//  ContentView.swift
//  Restart
//
//  Created by Appnap ws27 on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
    var body: some View {
        ZStack{
            if isOnboardingViewActive{
                OnBoardingView()
            } else{
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
