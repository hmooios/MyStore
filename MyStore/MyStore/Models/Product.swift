//
//  Product.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 08/12/2023.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String

//    // Implementing Identifiable protocol
//    var id: Int {
//        return self.id
//    }
}
