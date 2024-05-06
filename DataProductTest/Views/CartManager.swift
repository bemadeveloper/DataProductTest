//
//  CartManager.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Good] = []
    @Published private(set) var total: Float16 = 0.0
    
    func addToCart(good: Good) {
        products.append(good)
        total += good.price
    }
    
    func removeFromCart(good: Good) {
        products = products.filter { $0.id != good.id }
        total -= good.price
    }
}
