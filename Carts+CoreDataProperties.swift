//
//  Carts+CoreDataProperties.swift
//  Product
//
//  Created by Vinay on 19/01/24.
//
//

import Foundation
import CoreData


extension Carts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Carts> {
        return NSFetchRequest<Carts>(entityName: "Carts")
    }

    @NSManaged public var img: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Double

}

extension Carts : Identifiable {

}
