//
//  HomeScreen.swift
//  Hi Hasan Ecom
//
//  Created by Appnap ws27 on 17/5/23.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex : Int = 0
    
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table", "Computer Table"]
    var body: some View {
        ZStack{
            Color("Bg").edgesIgnoringSafeArea(.all)
            
            ScrollView   {
                VStack(alignment: .leading){
                    AppBarView()
                    TagLineView().padding()
                    SearchAndScanView()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(0 ..< categories.count) { item in
                                CategoryView(isActive: item == selectedIndex
                                             , text: categories[item])
                                .onTapGesture {
                                    selectedIndex = item
                                }
                            }
                        }.padding()
                    }
                    
                    ProductListWithTitleView(title: "Popoular")
                    ProductListWithTitleView(title: "Global").padding(.top)
                    
                    
                    
                }
            }
            
            //custom Bottom navbar
            
            HStack{
                TabItemView(image: Image("Home")){}
                TabItemView(image: Image(systemName: "heart.fill")){}
                TabItemView(image: Image(systemName: "mic")){}
                TabItemView(image: Image("User")){}
            }.padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color : Color.black.opacity(0.15), radius: 8, x: 2, y:6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
