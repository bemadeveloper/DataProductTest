//
//  Product+CoreDataProperties.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var brand: String?
    @NSManaged public var descriptionn: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var manufacturer: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Double

}

extension Product : Identifiable {

}
