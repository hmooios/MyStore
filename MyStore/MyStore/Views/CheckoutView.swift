//
//  CheckoutView.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 11/12/2023.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var productManager: ProductManager
    var address:Address
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    var body: some View {
        
        ScrollView {
            VStack {

                //List {
                    ForEach(productManager.products) { product in
                        CheckoutProductCard(product: product)
                            .environmentObject(productManager)
                    }
                    .padding()
               // }
                
                

                Text("Your total is \(productManager.total, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order"){
                    Task{
                        await placeOrder()
                    }
                }
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 150,height: 50)
                    .background(.black)
                    
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        
            
           
        }
    
    func placeOrder() async{
        guard
            let encoded = try? JSONEncoder().encode(address) else{
            print("failed to encode data")
            return
        }
        let url = URL(string: "https://reqres.in/api/products")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            // handle the result
            
            let decodedOrder = try JSONDecoder().decode(Address.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.streetAddress) is on its way!"
            showingConfirmation = true
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
        }
        
    }
    }

#Preview {
    CheckoutView( address: Address())
        .environmentObject(ProductManager())
}
