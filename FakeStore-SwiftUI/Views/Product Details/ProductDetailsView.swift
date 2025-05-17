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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
