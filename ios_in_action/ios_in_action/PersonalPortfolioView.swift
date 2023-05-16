//
//  PersonalPortfolioView.swift
//  ios_in_action
//
//  Created by Appnap ws27 on 16/5/23.
//

import SwiftUI

struct PersonalPortfolioView: View {
    fileprivate func backgroundColor() -> Color {
        return Color(.yellow)
    }
    
    var body: some View {
        ZStack{
            backgroundColor().ignoresSafeArea()
            VStack{
                
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:120,
                           height: 120,
                           alignment: .center)
                Text("Hasan Al Mamun")
                    .font(.headline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
             

                Text("Senior Software Engineer")
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
            
            }.padding()
        }
        
    }
}

struct PersonalPortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalPortfolioView()
    }
}
