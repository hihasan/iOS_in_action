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
        NavigationView {
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
                    TabItemView(image: Image(systemName: "house")){}
                    TabItemView(image: Image(systemName: "heart")){}
                    TabItemView(image: Image(systemName: "person")){}
                    TabItemView(image: Image(systemName: "gear")){}
                }.padding()
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding(.horizontal)
                    .shadow(color : Color.black.opacity(0.15), radius: 8, x: 2, y:6)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image("menu")
                    .padding()
                    .background(.white)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            Button(action:{}) {
                Image(uiImage: #imageLiteral(resourceName: "Profile"))
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }.padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search : String = ""
    var body: some View {
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text : $search)
            }.padding(.all, 20)
                .background(.white)
                .cornerRadius(10.0)
                .padding(.trailing)
            
            Button(action : {}) {
                
                Image(systemName: "magnifyingglass")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        } .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive : Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5 ))
            
            if(isActive){
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }.padding(.trailing)
    }
}

struct ProductCardView: View {
    let img : String
    let size : CGFloat
    var body: some View {
        VStack{
            Image(img)
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(10.0)
            
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2){
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(.white)
        .cornerRadius(20.0)
    }
}

struct ProductListWithTitleView: View {
    let title : String
    var body: some View {
        Text(title)
            .font(.custom("PlayfairDisplay-Regular", size: 24))
            .padding(.horizontal)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< 4) { index in
                    NavigationLink(
                        destination: DetailScreen(),
                        label:  {
                            ProductCardView(img: "chair_\(index+1)", size: 210).padding(.leading)
                    })
                    .navigationBarHidden(true)
                    .foregroundColor(.white)
                }
                .padding(.trailing)
            }
        }
    }
    
    
}

struct TabItemView: View {
    let image : Image
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
            image.foregroundColor(.black).frame(maxWidth: .infinity)
        })
    }
}
