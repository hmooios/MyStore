//
//  CheckoutProductCard.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 11/12/2023.
//


import SwiftUI

struct CheckoutProductCard: View {
    var product: Product
    @EnvironmentObject var productManager: ProductManager
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: product.image)){phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                }else if phase.error != nil{
                    Text("There was an error loading an image.")
                }else{
                    ProgressView()
                }
                
            }
              
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .bold()
                Text("$\(String(format: "%.2f", product.price))")
                    .foregroundColor(.gray)
            }
            
            Spacer()
            

        }
        .padding()
    }
}


#Preview {
    CheckoutProductCard(product: Product.example)
        .environmentObject(ProductManager())
        
}
