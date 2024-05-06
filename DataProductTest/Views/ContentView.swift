//
//  ContentView.swift
//  DataProductTest
//
//  Created by Bema on 4/5/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(goodList, id: \.id) { good in
                       ProductCard(good: good)
                                .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("KGmart Shop"))
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
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
