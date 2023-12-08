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
    let price: Int
    let description: String
    let images: [String]
    let creationAt: String
    let updatedAt: String
    
}

