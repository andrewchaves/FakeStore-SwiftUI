//
//  ProductRowView.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 17/05/25.
//

import SwiftUI
import FakeStoreCore

struct ProductRowView: View {
    
    let product: ProductForUI
    
    var body: some View {
        Text(product.title)
    }
}

#Preview {
    let mockProduct = ProductForUI(id: 1,
                 title: "Sample Product",
                 price: "$189,00",
                 description: "A sample product which has no porpuse beyond have some mocked data to validate the UI i am developing. So long and thanks for all the fishes",
                 image: "",
                 category: "Sample")
    ProductRowView(product: mockProduct)
}
