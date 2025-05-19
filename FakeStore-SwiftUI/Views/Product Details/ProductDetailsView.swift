//
//  ProductDetailsView.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 13/05/25.
//

import SwiftUI
import FakeStoreCore

struct ProductDetailsView: View {
    
    let product: ProductForUI
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 16.0) {
                AsyncImage(
                    url: URL(string: product.image),
                    content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12.0)
                    },
                    placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    }
                )
                
                Text(product.title)
                    .font(.title)
                    .bold()
                Text(product.price)
                    .font(.title2)
                    .foregroundColor(.secondary)
                Text(product.description)
                    .font(.body)
            }
            .navigationTitle("Product Details")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "cart")
            }
        }
    }
}

#Preview {
    let mockProduct = ProductForUI(id: 1,
                                   title: "Sample Product",
                                   price: "$189,00",
                                   description: "A sample product which has no porpuse beyond have some mocked data to validate the UI i am developing. So long and thanks for all the fishes",
                                   image: "",
                                   category: "Sample")
    ProductDetailsView(product: mockProduct)
}
