//
//  CartButton.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.755, brightness: 0.86))
                    .cornerRadius(50)
            }
        }
        
    }
}


#Preview {
    CartButton(numberOfProducts: 1)
}
