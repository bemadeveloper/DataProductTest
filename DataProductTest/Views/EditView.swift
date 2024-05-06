//
//  EditView.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//

import SwiftUI

struct EditView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var products: FetchedResults<Product>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            Text("Count: \(products.count)")
                .navigationTitle("Product")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Product", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddProductView()
                }
        }
    }
}

#Preview {
    EditView()
}
