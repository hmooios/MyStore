//
//  CartView.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 10/12/2023.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var productManager: ProductManager
    var numberOfProducts:Int
    @State private var isPlacingOrder = false
    @Bindable var address:Address

    var body: some View {
        if numberOfProducts > 0{
            List {
                ForEach(productManager.products) { product in
                    ProductRow(product: product)
                        .environmentObject(productManager)
                }
                
                // Total cost section
                Section {
                    HStack {
                        Text("Total")
                            .font(.headline)
                            .bold()
                        Spacer()
                        Text("$\(String(format: "%.2f", productManager.total))")
                            .font(.headline)
                            .bold()
                    }
                }
                Section{
                        NavigationLink("Delivery details") {
                            AddressView(address: address)
                        }
                }
            }
            .navigationTitle("Shopping Cart")
        } else{
            Text("Your cart is empty.")
        }
        
       
        
    }
    
  
}



#Preview {
    CartView(numberOfProducts: 1, address: Address())
        .environmentObject(ProductManager())
}
