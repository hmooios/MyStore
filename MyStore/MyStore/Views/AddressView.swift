//
//  AddressView.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 11/12/2023.
//

import SwiftUI

struct AddressView: View {
    @EnvironmentObject var productManager: ProductManager
    @Bindable var address:Address
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $address.name)
                TextField("Street Address", text: $address.streetAddress)
                TextField("City", text: $address.city)
                TextField("Zip", text: $address.zip)
            }
            Section {
                NavigationLink {
                    CheckoutView( address: address)
                        .environmentObject(productManager)
                } label: {
                    Text("Check out")
                }
            }.disabled(address.hasValidAddress == false)
       
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        }
    }


#Preview {
    AddressView(address: Address())
        .environmentObject(ProductManager())
}
