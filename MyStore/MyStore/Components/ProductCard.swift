//
//  ProductCard.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 10/12/2023.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var productManager: ProductManager

    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: product.image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                                               .aspectRatio(contentMode: .fit)
                                               .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 100) // Set a fixed height
                                               .cornerRadius(10)
                } else if phase.error != nil {
                    Text("There was an error loading an image.")
                } else {
                    ProgressView()
                }
            }
            VStack(alignment:.leading){
                Text(product.title)
                    .font(.subheadline)
                   // .bold()
                    .lineLimit(1) // Set maximum lines for the title
                    .truncationMode(.tail) //
                
                HStack{
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(.headline.bold())
                        .foregroundColor(.red)
                    
                    Spacer()
                    Button(action: {
                        productManager.addProduct(product: product)
                    }, label: {
                        Image(systemName: "cart.badge.plus")
                            .padding(8)
                            .foregroundColor(.black) // Text color
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    })
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}


struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Product.example)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
