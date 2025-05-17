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
                NavigationLink (destination: ProductDetailsView(product: product)){
                    ProductRowView(product: product)
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
