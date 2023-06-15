//
//  CustomButtonView.swift
//  Hike
//
//  Created by Appnap ws27 on 15/6/23.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .white,
                            .customGreenLight,
                            .customGreenMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom),
                    lineWidth: 4.0
                )
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30.0))
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
            
        }
        .frame(width: 58.0, height: 58.0)
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
