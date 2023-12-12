//
//  ProductRow.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 10/12/2023.
//

import SwiftUI

struct ProductRow: View {
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
            
            Button(action: {
                productManager.removeProduct(product: product)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct CameraRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product.example)
            .environmentObject(ProductManager())
    }
}


