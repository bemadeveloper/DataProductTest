//
//  DetailProduct.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//

import SwiftUI

struct DetailProduct: View {
    //var editManager =
    var good: Good
    
    var body: some View {
        VStack {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    Image(uiImage: good.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    
                    DescriptionView(good: good)
                        .offset(y: -40)
                    
                        .toolbar {
                            NavigationLink {
                                PencilView(good: .constant(goodList[0]))
                            } label: {
                                EditButton()
                            }
                        }
                }
            }
        }
}
    
struct DescriptionView: View {
    @State private var counter = 1
    var good: Good
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(good.name)")
                .fontWeight(.bold)
                .padding(.vertical, 8)
            HStack(spacing: 4) {
                ForEach(0..<5) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                Text("(4.6)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            Text("Описание")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text(good.description ?? "")
                .lineSpacing(6)
                .opacity(0.6)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Размеры")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("42-50")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Производитель")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text(good.brand)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Цвета")
                        .fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: .black)
                        ColorDotView(color: .red)
                        ColorDotView(color: .blue)
                    }
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Количество")
                        .fontWeight(.semibold)
                    
                    HStack() {
                        Button(action: {
                            self.counter -= 1
                        }) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("\(counter)")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action: {
                            self.counter += 1
                        }) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        //.frame(width: 30, height: 30)
                        .background(.brown)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color.white)
        .cornerRadius(40)
        }
    }
}
    
struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

#Preview {
    DetailProduct(good: goodList[0])
        .environmentObject(CartManager())
}
