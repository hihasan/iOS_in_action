//
//  InfoPannelView.swift
//  Pinch
//
//  Created by Appnap ws27 on 14/6/23.
//

import SwiftUI

struct InfoPannelView: View {
    var scale : CGFloat
    var offset : CGSize
    
    @State private var isInfoPannelVisible : Bool = false
    
    var body: some View {
        HStack{
            //MARK: - HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1){
                    withAnimation(.easeOut){
                        isInfoPannelVisible.toggle()
                    }
                }
            
            Spacer()
            
            //MARK: - INFO PANEL
            HStack{
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(8.0)
            .background(.ultraThinMaterial)
            .cornerRadius(8.0)
            .frame(maxWidth: 420.0)
            .opacity(isInfoPannelVisible ? 1 : 0)
            
            Spacer()
        }
    }
}

struct InfoPannelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPannelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
