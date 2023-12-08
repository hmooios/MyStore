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
        List(products, id: \.id) { result in
            HStack(alignment: .top) {
                // Image
                AsyncImage(url: URL(string: result.images[0])) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }

                // Title and price
                VStack(alignment: .leading) {
                    Text(result.title)
                        .font(.headline)
                    Text("$\(result.price).00")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Jewelry")
        .task {
            await loadData()
        }

        
    }
    func loadData() async {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/products") else {
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
