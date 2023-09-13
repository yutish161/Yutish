//
//  ContentView.swift
//  ecomName
//
//  Created by user on 13/09/23.
//

import SwiftUI

struct Product: Identifiable{
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
}

let sampleProducts = [
    
    Product(name: "Mackbook M2", price: 1000.00, imageName: "Mackbook"),
    Product(name: "iPhone 15 Pro", price: 999.00, imageName: "Iphone"),
    Product(name: "iPad", price: 1200.00, imageName: "Ipad"),
    Product(name: "Airpods", price: 275.00, imageName: "Airpods")
    
]

struct ProductTile: View{
    let product: Product
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8) {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(maxHeight: 150)
            
            Text(product.name)
                .font(.headline)
            
            Text("$\(String(format: "%.2f", product.price))")
                .font(.subheadline)
                .foregroundColor(
                .secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}
struct ContentView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(sampleProducts)
                    {product in
                        NavigationLink(destination:
                                        ProductDetail(product: product)) {
                            ProductTile(product: product)
                            
                        }
                    
                    
                        
                    }
                }
            }
            .padding(30)
        }
        .navigationTitle("E-commerce Store App")
    }
    
    struct ProductDetail: View {
        let product: Product
        
        var body: some View{
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            Text(product.name)
                .font(.title)
                .padding()
            Text("Price: $\(String(format:"%.2F", product.price))")
                .font(.headline)
                .padding()
            Spacer()
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

