//
//  CoreDataManager.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//

import Foundation
import CoreData
import UIKit

typealias EmptyClosure = () -> Void

final class CoreDataManager {
    let container: NSPersistentContainer
    var savedEntities = [Product]()
    
    var onChanged: EmptyClosure?
    
    init() {
        container = NSPersistentContainer(name: "Product")
        container.loadPersistentStores { description, error in
            if let error {
                print("Невозможно загрузить базу данных")
            } else {
                print("База данных загружена")
                self.myProducts()
            }
        }
        fetchProducts()
    }
    
    func fetchProducts() {
        let request = NSFetchRequest<Product>(entityName: "Product")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
            onChanged?()
        } catch let error {
            print("Не удалось получить данные из базы данных. Ошибка: \(error.localizedDescription)")
        }
    }
    
    func addProduct(name: String, image: UIImage?, price: Double, description: String?, brand: String, manufacturer: String) {
        let newProduct = Product(context: container.viewContext)
        newProduct.name = name
        newProduct.price = price
        newProduct.descriptionn = description
        newProduct.brand = brand
        newProduct.manufacturer = manufacturer
        
        if let image = image {
                newProduct.image = image.pngData() // Преобразование UIImage в Data
            }
        
        saveData()
    }
    
    func updateData(product: Product, name: String, image: UIImage?, price: Double, description: String?, brand: String, manufacturer: String) {
        product.name = name
        product.price = price
        product.descriptionn = description
        product.brand = brand
        product.manufacturer = manufacturer
        
        if let image = image {
                product.image = image.pngData() // Преобразование UIImage в Data
            }
        
        saveData()
    }
    
    func deleteProduct(product: Product) {
        container.viewContext.delete(product)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchProducts()
        } catch let error {
            print("Не удается сохранить данные. Ошибка: \(error.localizedDescription)")
        }
    }
    
    
    func myProducts() {
        addProduct(name: "Классические брюки", image: UIImage(named: "image1"), price: 69.0, description: "Брюки женские на широком поясе, брючина классическая прямая. Покупая у нас брюки на широком поясе, клеш от колена, вы получаете удобный и практичный пример того, что качественная классическая одежда может быть недорогой.", brand: "Zara", manufacturer: "KG mart")
        addProduct(name: "Черная юбка", image: UIImage(named: "image2"), price: 102.9, description: "Черная юбка с высокой талией и классическим кроем. Изготовлена из качественного материала, который приятен на ощупь и хорошо держит форму. Идеальный выбор для создания элегантного и стильного образа", brand: "H&M", manufacturer: "Fashion Forge")
        addProduct(name: "Костюм классический", image: UIImage(named: "image3"), price: 210.90, description: "Офисный костюм представляет собой стильное и элегантное сочетание пиджака и брюк. Пиджак имеет классический крой с акцентом на стройную фигуру.", brand: "Gucci", manufacturer: "Atelier Couture")
        addProduct(name: "Костюм двойка", image: UIImage(named: "image4"), price: 103.5, description: "Женский костюм двойка с топом - это элегантный и стильный набор, который подходит как для деловых мероприятий, так и для повседневной носки в офисе.", brand: "Adidas", manufacturer: "KG mart")
        addProduct(name: "Мужские джинсы", image: UIImage(named: "image5"), price: 89.0, description: "Джинсы давно стали частью базового гардероба мужчины. Правильно подобранные джинсы скрывают изъяны, подчеркивают достоинства фигуры и органично смотрятся при любом стиле одежды.", brand: "Nike", manufacturer: "Fashion Forge")
        addProduct(name: "Блуза женская", image: UIImage(named: "image6"), price: 69.7, description: nil, brand: "Zara", manufacturer: "Atelir Couture")
        addProduct(name: "Красная двойка", image: UIImage(named: "image7"), price: 87.3, description: nil, brand: "L&V", manufacturer: "Fashion Forge")
        addProduct(name: "Футболка оверсайз", image: UIImage(named: "image8"), price: 93.1, description: nil, brand: "H&M", manufacturer: "KG mart")
        addProduct(name: "Костюм спортивный", image: UIImage(named: "image9"), price: 102.15, description: nil, brand: "KKM", manufacturer: "Atelier Couture")
        addProduct(name: "Джинсовые шорты", image: UIImage(named: "image10"), price: 91.4, description: nil, brand: "Zara", manufacturer: "Fashion Forge")
        addProduct(name: "Мужская футболка", image: UIImage(named: "image11"), price: 35.76, description: nil, brand: "Nike", manufacturer: "KG mart")
        addProduct(name: "Осенняя жилетка", image: UIImage(named: "image12"), price: 75.79, description: nil, brand: "Adidas", manufacturer: "Atelier Couture")
    }
    
}
