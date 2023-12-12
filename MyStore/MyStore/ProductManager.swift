//
//  ProductManager.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 10/12/2023.
//

import Foundation

class ProductManager:ObservableObject{
    
    @Published private(set) var products:[Product] = []
    @Published private(set) var total:Double = 0.0
    
    var fileURL:URL{
       let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return directory.appendingPathComponent("products.json")
    }
    
    init(){
        loadProduct()
    }
    
    func saveProduct(){
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: fileURL)
        } catch let error {
            print("Error saving products in the shopping cart: \(error)")
        }
    }
    
    func loadProduct(){
        do {
            let data = try Data(contentsOf: fileURL)
            products = try JSONDecoder().decode([Product].self, from: data)
            updateTotal()
        } catch let error {
            print("Error saving products in the shopping cart: \(error)")
        }
    }
    
    func addProduct(product:Product){
        products.append(product)
        total+=product.price
        saveProduct()
    }
    func removeProduct(product:Product){
    products = products.filter{$0.id != product.id}
        total-=product.price
        saveProduct()
    }
    
    private func updateTotal() {
        total = products.reduce(0) { $0 + $1.price }
       }
    

}
