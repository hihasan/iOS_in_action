//
//  ContentView.swift
//  Pinch
//
//  Created by Appnap ws27 on 14/6/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @State private var isAnimating : Bool = false
    @State private var imageScale : CGFloat = 1
    @State private var imageOffset : CGSize = .zero
    
    // MARK: - FUNCTION
    func resetImageState(){
        return withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero
        }
    }
    // MARK: - CONTENT
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.clear
                //MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10.0)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x : 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x : imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)

                //MARK: 1. TAP GESTURE
                    .onTapGesture (count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        } else {
                            withAnimation(.spring()){
                                resetImageState()
                            }
                        }
                    })
                
                //MARK: 2. Drag GESTURE
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                withAnimation(.linear(duration: 1)){
                                    imageOffset = value.translation
                                
                                }
                            }
                            .onEnded{ _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                                
                            }
                    )
                //MARK: - 3. MAGNIFICATION
                    .gesture(
                        MagnificationGesture()
                            .onChanged{ value in
                                withAnimation(.linear(duration: 1)){
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    } else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                            .onEnded{ _ in
                                if imageScale > 5 {
                                    imageScale = 5
                                } else if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
            }
            .navigationTitle(" Pinch & Zoom ")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)){
                    isAnimating = true
                }
            })
            
            //MARK: - INFO PANNEL
            .overlay(
                InfoPannelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
        }
        //MARK: - CONTROLS
        .overlay(
            Group{
                HStack{
                    Button{
                        withAnimation(.spring()){
                            if imageScale > 1 {
                                imageScale -= 1
                            }
                            
                            if imageScale <= 1 {
                                resetImageState()
                            }
                        }
                    } label: {
                        ControllImageView(icon : "minus.magnifyingglass")
                    }
                    
                    Button{
                        resetImageState()
                    } label: {
                        ControllImageView(icon : "arrow.up.left.and.down.right.magnifyingglass")
                    }
                    
                    Button{
                        withAnimation(.spring()){
                            if imageScale < 5 {
                                imageScale += 1
                            }
                            
                            if imageScale > 5 {
                                imageScale = 5
                            }
                        }
                    } label: {
                        ControllImageView(icon : "plus.magnifyingglass")
                    }
                }
                .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                .background(.ultraThinMaterial)
                .cornerRadius(12.0)
                .opacity(isAnimating ? 1 : 0)
            }
                .padding(.bottom, 30)
            , alignment: .bottom
        )
        .navigationViewStyle(.stack)
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
