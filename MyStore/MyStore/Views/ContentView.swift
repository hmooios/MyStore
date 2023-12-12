//
//  ContentView.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 08/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var products = [Product]()
    @State private var address = Address()
    @StateObject var productManager = ProductManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    

    var body: some View {
      
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns,spacing: 20)
                 {
                    ForEach(products) { product in
                        NavigationLink {
                          //  Text(product.description)
                            ProductDetailsView(product: product)
                        } label: {
                            ProductCard(product: product)
                                .environmentObject(productManager)
                        }


                    }
                 }.padding()
            }
            .navigationTitle("My store")
            .toolbar{
                NavigationLink {
                    CartView( numberOfProducts: productManager.products.count, address: address)
                        .environmentObject(productManager)
                } label: {
                    CartButton(numberOfProduct: productManager.products.count)
                }
            }

        }
        .environmentObject(productManager)
        
        .task {
            await loadData()
        }
    }
                           
    func loadData() async {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            print("Invalid URL.")
            return
        }


        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode([Product].self, from: data){
                products = decodedData
            }
        } catch {
           
                print("Error loading data:", error)
            }
        
    }
}

#Preview {
    ContentView()
}
