//
//  ContentView.swift
//  ios_in_action
//
//  Created by Hasan Al Mamun on 11/5/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
    
        NavigationView{
            Screen(title: "Home", text: "First Screen", imageName: "house")
        }
        
    }
}

struct Screen : View{
    let title: String
    let text: String
    let imageName : String
    
    var body: some View{
        VStack{
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:200,
                       height: 200,
                       alignment: .center)
                .padding()
            
            Text(text).font(.system(size: 30, weight: .light, design: .default)).padding()
            
            
            NavigationLink(
                destination: Screen(title: "Notification",
                                    text: "Notification Screen",
                                    imageName: "bell"),
                label: {
                    ContinueButton()
                }
            )
        }.navigationTitle(title)
    }
}

struct ContinueButton : View{
    var body: some View{
    
        Text("Continue")
            .frame(width: 200, height: 50, alignment: .center)
            .background(Color.pink)
            .foregroundColor(Color.white)
            .cornerRadius(15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
