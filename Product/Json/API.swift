//
//  API.swift
//  Product
//
//  Created by Vinay on 10/01/24.
//

import Foundation



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)


// MARK: - Welcome
struct Welcome: Decodable {
    let status: Bool
    let message: String
    let categories: [Category]
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


class DataHandler {
    
    init() {
        
    }
    
    func loadData() {
        let path = Bundle.main.path(forResource: "shopping", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try? Data(contentsOf: url)
            let res = try JSONDecoder().decode([Welcome].self, from: data!)
            print(res.first?.categories.first?.name)
        } catch {
            
        }
    }
    
    
}

