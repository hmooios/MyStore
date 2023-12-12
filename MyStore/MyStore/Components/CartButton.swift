//
//  CartButton.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 10/12/2023.
//

import SwiftUI

struct CartButton: View {
    var numberOfProduct: Int
    
    var body: some View {
        ZStack {
            Image(systemName: "cart")
                //.font(.title)
              //  .foregroundColor(.blue) // Adjust color based on your app's theme
            
            if numberOfProduct > 0 {
                Circle()
                    .fill(Color.red) // Highlight with a contrasting color
                    .frame(width: 18, height: 18)
                    .overlay(
                        Text("\(numberOfProduct)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    )
                    .offset(x: 10, y: -10) // Adjust position based on your design
            }
        }
    }
}


#Preview {
    CartButton(numberOfProduct: 1)
}
