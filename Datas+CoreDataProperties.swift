//
//  Datas+CoreDataProperties.swift
//  Product
//
//  Created by Vinay on 19/01/24.
//
//

import Foundation
import CoreData


extension Datas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Datas> {
        return NSFetchRequest<Datas>(entityName: "Datas")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double

}

extension Datas : Identifiable {

}
