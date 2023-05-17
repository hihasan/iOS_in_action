//
//  DetailScreen.swift
//  Hi Hasan Ecom
//
//  Created by Hasan Al Mamun on 18/5/23.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("Bg").edgesIgnoringSafeArea(.all)
            
            ScrollView{
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                
                DescriptionView()
                    .offset(y:-40)
            }.edgesIgnoringSafeArea(.top)
            
            HStack{
                Text("$1299").font(.title).foregroundColor(.white )
                Spacer()
                Button(action : {}, label: {
                    Text("Add To Cart").padding().padding(.horizontal).background(.white).cornerRadius(10.0).foregroundColor(Color("Primary"))
                })
            }.padding()
                .padding(.horizontal)
                .background(Color("Primary"))
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:CustomButtonView(action: {presentationMode.wrappedValue.dismiss()}) , trailing: Image("threeDot"))
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading ){
            Text("Luruxy Swedia \nChair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack{
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack(alignment: .top){
                VStack(alignment: .leading ) {
                    Text("Size").fontWeight(.semibold).padding(.bottom, 4)
                    Text("Height: 120 cm").opacity(0.6)
                    Text("Width: 80 cm").opacity(0.6)
                    Text("Diameter: 72 cm").opacity(0.6)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                 VStack(alignment: .leading ) {
                    Text("Treatment").fontWeight(.semibold).padding(.bottom, 4)
                    Text("Jati Wood, Canvas, \nAmazing Love").opacity(0.6)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
            }.padding(.vertical)
            
            HStack{
                VStack(alignment: .leading ) {
                    Text("Colors").fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: .white)
                        ColorDotView(color: .red)
                        ColorDotView(color: Color("Primary") )
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Quantity").fontWeight(.semibold)
                    HStack{
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1").font(.title2).fontWeight(.semibold).padding(.all, 8)
                        
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
                
            }
        }.padding()
            .padding(.top)
            .background(Color("Bg"))
            .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color : Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct CustomButtonView: View {
    let action : ()-> Void
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(.white)
                .cornerRadius(8.0)
        })
    }
}
