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
        if #available(iOS 16.0, *) {
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
                    
                    Text(product.title)
                        .font(.title)
                        .bold()
                    Text(product.price)
                        .font(.title2)
                        .foregroundColor(.secondary)
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
                        }
                        .padding(.horizontal, 8.0)
                    }//: GeometryReader
                    .frame(height: 60.0)
                }//: VStack
                .navigationTitle("Product Details")
                .navigationBarTitleDisplayMode(.inline)
            }//: ScrollView
            .padding()
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CartView(cartItemsViewModel:
                                                            CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository))) {
                        Image(systemName: "cart")
                            .foregroundColor(.black)
                    }
                }//: ToolbarItem
            }
        } else {
            // Fallback on earlier versions
        }//: toolbar
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
