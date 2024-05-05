//
//  AddProductView.swift
//  DataProductTest
//
//  Created by Bema on 4/5/24.
//

import SwiftUI

struct AddProductView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var price = ""
    @State private var image = ""
    @State private var descriptionn = ""
    @State private var brand = ""
    @State private var manufacturer = ""
    
    let manufacturers = ["KG mart", "Fashion Forge", "Atelier Couture"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of product", text: $name)
                    TextField("Price", text: $price)
                    TextField("Description", text: $descriptionn)
                    TextField("Brand", text: $brand)
                    
                    Picker("Manufacturer", selection: $manufacturer) {
                        ForEach(manufacturers, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Section {
                        Button("Save") {
                            let newProduct = Product(context: moc)
                            newProduct.id = UUID()
                            newProduct.name = name
                            newProduct.price = Double(price) ?? 0.0
                            newProduct.descriptionn = descriptionn
                            newProduct.brand = brand
                            newProduct.manufacturer = manufacturer
                            
                            try? moc.save()
                            moc.refreshAllObjects()
                            dismiss()
                        }
                    }
                }
                .navigationTitle("Add Product")
            }
        }
    }
}

#Preview {
    AddProductView()
}
