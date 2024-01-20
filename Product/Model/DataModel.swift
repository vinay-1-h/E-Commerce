//
//  DataModel.swift
//  Product
//
//  Created by Vinay on 20/01/24.
//

import Foundation
// MARK: - Welcome
struct Welcome: Decodable {
    let status: Bool
    let message: String
    var categories: [Category]
}

// MARK: - Category
struct Category: Decodable {
    let id: Int
    let name: String
    let items: [Item]
}

// MARK: - Item
struct Item: Decodable {
    let id: Int
    let name: String
    let icon: String
    let price: Double
}
