//
//  ContentView.swift
//  MyStore
//
//  Created by Hmoo Myat Theingi on 08/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var products = [Product]()

    var body: some View {
        List(products,id: \.id) { product in
            AsyncImage(url: URL(string: product.image)){phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .scaledToFit()
                }else if phase.error != nil{
                    Text("There was an error loading images")
                }else{
                    ProgressView()
                }
            }
        }
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
