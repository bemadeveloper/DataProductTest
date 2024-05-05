//
//  ContentView.swift
//  DataProductTest
//
//  Created by Bema on 4/5/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var coreDataManager = CoreDataManager()
    var cartManager = CartManager()
    
    init() {
        coreDataManager.myProducts()
    }
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(coreDataManager.savedEntities, id: \.id) {
                        product in
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            navigationTitle(Text("KGmart Shop"))
                .toolbar {
                    NavigationLink {
                        CartView()
                            .environmentObject(cartManager)
                    } label: {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
