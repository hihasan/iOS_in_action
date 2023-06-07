//
//  ContentView.swift
//  Remote Image
//
//  Created by Appnap ws27 on 7/6/23.
//

import SwiftUI

extension Image{
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth: 128.0)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageUrl : String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        //Mark 1 - basic
//        AsyncImage(url: URL(string: imageUrl))
        
        //Mark 2 - Scale
//        AsyncImage(url: URL(string: imageUrl), scale: 3.0)
        
        //Mark 3 - Place Holder
//        AsyncImage(url: URL(string: imageUrl)){image in
//            image.imageModifier()
//
//
//        }placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifiew()
//
//        }.padding(40)
        
        //Mark 4 - Phase
//        AsyncImage(url: URL(string: imageUrl)){phase in
//
//            if let image = phase.image{
//                image.imageModifier()
//            } else if phase.error !=  nil{
//                Image(systemName: "ant.circle.fill").iconModifier()
//            } else{
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//
//        }.padding(40)
        
        //Mark 5 - Animation
        AsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){phase in
            switch phase{
            case .success(let image):
                image.imageModifier()
                    .transition(.move(edge: .bottom))
                
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
                
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }.padding(40.0)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
