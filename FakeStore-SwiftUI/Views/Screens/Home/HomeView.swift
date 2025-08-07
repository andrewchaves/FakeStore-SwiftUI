//
//  ContentView.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 12/05/25.
//

import SwiftUI
import FakeStoreCore

struct HomeView: View {
    @StateObject private var productsViewModel = ProductVM()
    var body: some View {
        NavigationView {
            List (productsViewModel.filteredProducts){ product in
                NavigationLink (destination: ProductDetailsView(product: product, cartItemViewModel: CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository))){
                    ProductRowView(product: product)
                }
            }
            .listStyle(.plain)
            .navigationTitle("FakeStore")
            .toolbar {
                
                //Cart Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CartView(cartItensViewModel:
                                                            CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository))) {
                        Image(systemName: "cart")
                            .foregroundColor(.black)
                    }
                }//: ToolbarItem
                
                //Filter Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            print("All Products")
                        } label: {
                            Label("All Products", systemImage: "line.3.horizontal")
                        }
                        
                        Button {
                            print("Roupas")
                        } label: {
                            Label("Roupas", systemImage: "line.3.horizontal")
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }//: ToolbarItem
            }
        }
        .onAppear {
            productsViewModel.fetchProducts()
        }
    }
}

#Preview {
    HomeView()
}
