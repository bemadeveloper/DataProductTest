//
//  ProductRow.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    
    var good: Good
    
    var body: some View {
        HStack(spacing: 20) {
            Image(uiImage: good.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(good.name)
                            .bold()
                        
                        Text("$\(good.price)")
                    }
                    
                    Spacer()
                    
                    Image(systemName: "trash")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.755, brightness: 0.86))
                        .onTapGesture {
                            cartManager.removeFromCart(good: good)
                        }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
}

#Preview {
    ProductRow(good: goodList[0])
        .environmentObject(CartManager())
}
