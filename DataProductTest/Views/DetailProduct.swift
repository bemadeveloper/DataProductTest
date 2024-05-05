//
//  DetailProduct.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//

import SwiftUI

struct DetailProduct: View {
   
    @State private var counter = 1
    var product: Product
    
    var body: some View {
        VStack {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    if let imageData = product.image, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.top)
                    }
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
                                
                                Text(product.descriptionn ?? "")
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
                                        
                                        Text(product.brand ?? "")
                                            .opacity(0.6)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.vertical)
                                    Text("Редактировать")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 10)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                }
                                .padding(.top, 20)
                                
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

#Preview {
    DetailProduct(product: Product())
        .environmentObject(CartManager())
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}
