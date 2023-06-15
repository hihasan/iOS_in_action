//
//  CardView.swift
//  Hike
//
//  Created by Appnap ws27 on 15/6/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - HEADER
                VStack(alignment : .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Spacer()
                        
                        Button{
                            
                        } label: {
                            CustomButtonView()
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }.padding(.horizontal, 30)
                
                
                //MARK: - MAIN CONTENT
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color("ColorIndigoMedium"),
                                    Color("ColorSalmonLight")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .scaledToFit()
                        .frame(width: 256, height: 256)
                    Image("image-1")
                        .resizable()
                    .scaledToFit()
                }
                
                //MARK: - FOOTER
            }
        }
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
