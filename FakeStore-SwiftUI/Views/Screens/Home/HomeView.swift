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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "cart")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "line.3.horizontal")
                }
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
