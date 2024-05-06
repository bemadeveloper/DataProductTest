//
//  Good.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//

import Foundation
import UIKit

struct Good: Identifiable {
    var id = UUID()
    var name: String
    var image: UIImage
    var price: Float16
    var description: String?
    var brand: String
    var manufacturer: String
}

var goodList = [
    Good(name: "Классические брюки", image: UIImage(named: "image1")!, price: 69.0, description: "Брюки женские на широком поясе, брючина классическая прямая. Покупая у нас брюки на широком поясе, клеш от колена, вы получаете удобный и практичный пример того, что качественная классическая одежда может быть недорогой.", brand: "Zara", manufacturer: "KG mart"),
    Good(name: "Черная юбка", image: UIImage(named: "image2")!, price: 102.9, description: "Черная юбка с высокой талией и классическим кроем. Изготовлена из качественного материала, который приятен на ощупь и хорошо держит форму. Идеальный выбор для создания элегантного и стильного образа", brand: "H&M", manufacturer: "Fashion Forge"),
    Good(name: "Костюм классический", image: UIImage(named: "image3")!, price: 210.90, description: "Офисный костюм представляет собой стильное и элегантное сочетание пиджака и брюк. Пиджак имеет классический крой с акцентом на стройную фигуру.", brand: "Gucci", manufacturer: "Atelier Couture"),
    Good(name: "Костюм двойка", image: UIImage(named: "image4")!, price: 103.5, description: "Женский костюм двойка с топом - это элегантный и стильный набор, который подходит как для деловых мероприятий, так и для повседневной носки в офисе.", brand: "Adidas", manufacturer: "KG mart"),
    Good(name: "Мужские джинсы", image: UIImage(named: "image5")!, price: 89.0, description: "Джинсы давно стали частью базового гардероба мужчины. Правильно подобранные джинсы скрывают изъяны, подчеркивают достоинства фигуры и органично смотрятся при любом стиле одежды.", brand: "Nike", manufacturer: "Fashion Forge"),
    Good(name: "Блуза женская", image: UIImage(named: "image6")!, price: 69.7, description: nil, brand: "Zara", manufacturer: "Atelir Couture"),
    Good(name: "Красная двойка", image: UIImage(named: "image7")!, price: 87.3, description: nil, brand: "L&V", manufacturer: "Fashion Forge"),
    Good(name: "Футболка оверсайз", image: UIImage(named: "image8")!, price: 93.1, description: nil, brand: "H&M", manufacturer: "KG mart"),
    Good(name: "Костюм спортивный", image: UIImage(named: "image9")!, price: 102.15, description: nil, brand: "KKM", manufacturer: "Atelier Couture"),
    Good(name: "Джинсовые шорты", image: UIImage(named: "image10")!, price: 91.4, description: nil, brand: "Zara", manufacturer: "Fashion Forge"),
    Good(name: "Мужская футболка", image: UIImage(named: "image11")!, price: 35.76, description: nil, brand: "Nike", manufacturer: "KG mart"),
    Good(name: "Осенняя жилетка", image: UIImage(named: "image12")!, price: 75.79, description: nil, brand: "Adidas", manufacturer: "Atelier Couture")
]
