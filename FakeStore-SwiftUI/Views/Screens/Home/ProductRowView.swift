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
        HStack (alignment: .top){
            AsyncImage(
                url: URL(string: product.image),
                content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60.0, height: 60.0)
                        .cornerRadius(8.0)
                }, placeholder: {
                    ProgressView()
                        .frame(width: 60.0, height: 60.0)
                }
            )//: AsyncImage
            
            VStack (alignment: .leading, spacing: 5.0){
                //Product Title
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                //Product Price
                Text(product.price)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }//: VStack
        }//: HStack
        .padding(.vertical, 4.0)
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
