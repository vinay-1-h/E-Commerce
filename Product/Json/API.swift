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




class DataHandler {
    init() {
    }
    
    func loadData(completion: @escaping(Result<Welcome,Error>)->Void) {
        let path = Bundle.main.path(forResource: "shopping", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try? Data(contentsOf: url)
            let res = try JSONDecoder().decode(Welcome.self, from: data!)
            completion(.success(res))
        } catch {
            
        }
    }
}

