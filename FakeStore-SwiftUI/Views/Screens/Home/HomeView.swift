//
//  ContentView.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 12/05/25.
//

import SwiftUI
import FakeStoreCore

struct HomeView: View {
    //Properties
    @StateObject private var productsViewModel = ProductVM()
    @StateObject private var categoriesViewModel = CategorytVM()
    
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
                    NavigationLink(destination: CartView(cartItemsViewModel:
                                                            CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository))) {
                        Image(systemName: "cart")
                            .foregroundColor(.black)
                    }
                }//: ToolbarItem
                
                //Filter Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        //Default
                        Button {
                            self.productsViewModel.filterProducts(category: nil)
                        } label: {
                            Label("All Products", systemImage: "line.3.horizontal.decrease.circle")
                        }
                        //Other items
                        ForEach(categoriesViewModel.categories, id: \.name) { category in
                            Button {
                                self.productsViewModel.filterProducts(category: category.name)
                            } label: {
                                Label(category.name, systemImage: "line.3.horizontal.decrease.circle")
                            }
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
            categoriesViewModel.fetchCategories()
        }
    }
}

#Preview {
    HomeView()
}
