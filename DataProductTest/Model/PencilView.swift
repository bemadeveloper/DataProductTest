//
//  PencilView.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//

import SwiftUI

struct PencilView: View {
    
    @Binding var good: Good
    
//    @Environment(\.managedObjectContext) var moc
//    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var price = 0.0
    @State private var image = ""
    @State private var descriptionn = ""
    @State private var brand = ""
    @State private var manufacturer = ""
    
    let manufacturers = ["KG mart", "Fashion Forge", "Atelier Couture"]
    
    var descriptionBinding: Binding<String> {
        Binding<String>(
            get: { good.description ?? "" }, // Возвращаем пустую строку, если description равно nil
            set: { good.description = $0 } // Устанавливаем новое значение для description
        )
    }

    
  
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of product", text: $good.name)
                    TextField("Price", value: $good.price, formatter: NumberFormatter())
                    TextField("Description", text: descriptionBinding)
                    TextField("Brand", text: $good.brand)
                    
                    Picker("Manufacturer", selection: $good.manufacturer) {
                        ForEach(manufacturers, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Section {
                        Button("Save") {
                            for index in 0..<goodList.count {
                                var updatedGood = goodList[index]
                                updatedGood.name = name
                                updatedGood.price = Float16(price)
                                updatedGood.description = descriptionn
                                updatedGood.brand = brand
                                updatedGood.manufacturer = manufacturer
                                goodList[index] = updatedGood
                                
                            }
//                            let newProduct = Product(context: moc)
//                            newProduct.id = UUID()
//                            newProduct.name = name
//                            newProduct.price = Double(price) ?? 0.0
//                            newProduct.descriptionn = descriptionn
//                            newProduct.brand = brand
//                            newProduct.manufacturer = manufacturer
                            
//                            try? moc.save()
//                            moc.refreshAllObjects()
//                            dismiss()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.blue)
                    }
                }
                .navigationTitle("Add Product")
            }
        }
    }
    
}

#Preview {
    PencilView(good: .constant(goodList[0]))
}
