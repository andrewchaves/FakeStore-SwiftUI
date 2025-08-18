//
//  ProductDetailsView.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 13/05/25.
//

import SwiftUI
import FakeStoreCore


struct ProductDetailsView<ViewModel: CartItemViewModelProtocol & ObservableObject>: View {
    
    let product: ProductForUI
    @ObservedObject var cartItemViewModel: ViewModel
    
    init(product: ProductForUI, cartItemViewModel: ViewModel) {
        self.product = product
        self.cartItemViewModel = cartItemViewModel
    }
    
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
                )//: AsyncImage
                
                //Product Title
                Text(product.title)
                    .font(.title)
                    .bold()
                //Product Price
                Text(product.price)
                    .font(.title2)
                    .foregroundColor(.secondary)
                //Product Description
                Text(product.description)
                    .font(.body)
                
                Spacer()
                
                GeometryReader { geometry in
                    let availableWidth = geometry.size.width - 16
                    HStack(spacing: 8.0) {
                        GeneralButton(title: "Add to cart", backgroundColor: .blue) {
                            cartItemViewModel.addProduct(product)
                        }
                        .frame(width: availableWidth * 2/5)
                        GeneralButton(title: "Buy it Now!", backgroundColor: .green) {
                            print("Buy it now!")
                        }
                        .frame(width: availableWidth * 3/5)
                    }//: HStack
                    .padding(.horizontal, 8.0)
                }//: GeometryReader
                .frame(height: 60.0)
            }//: VStack
            .navigationTitle("Product Details")
            .navigationBarTitleDisplayMode(.inline)
        }//: ScrollView
        .padding()
        .hideScrollIndicatorsIfAvailable()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CartView(cartItemsViewModel:
                                                        CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository))) {
                    Image(systemName: "cart")
                        .foregroundColor(.black)
                }//: CartView
            }//: ToolbarItem
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
    ProductDetailsView(product: mockProduct, cartItemViewModel: CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository))
}
