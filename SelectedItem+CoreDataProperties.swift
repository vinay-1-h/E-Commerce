//
//  SelectedItem+CoreDataProperties.swift
//  Product
//
//  Created by Vinay on 19/01/24.
//
//

import Foundation
import CoreData


extension SelectedItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SelectedItem> {
        return NSFetchRequest<SelectedItem>(entityName: "SelectedItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double

}

extension SelectedItem : Identifiable {

}
