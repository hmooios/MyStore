//
//  ProductDetailsView.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 12/12/2023.
//

import SwiftUI

struct ProductDetailsView: View {
   // @EnvironmentObject var productManager: ProductManager
    var product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: product.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .padding()
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        ProgressView()
                            .padding()
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                    
                    Text(product.description)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                    
                    HStack {
                        Text("Price:")
                            .font(.headline)
                        Text("$\(String(format: "%.2f", product.price))")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                }
                .padding()
            
                
                Spacer()
            }
        }
        .navigationTitle(product.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ProductDetailsView(product: Product.example)
       // .environmentObject(ProductManager())
}
