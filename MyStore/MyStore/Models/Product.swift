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

    static let example = Product(id: 1, title: "Unknown title", price: 0.00, description: "Unknown description", image: "photo")
}
