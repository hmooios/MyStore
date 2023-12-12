//
//  Address.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 11/12/2023.
//

import Foundation

@Observable
class Address:Codable{
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }

        return true
    }
}
