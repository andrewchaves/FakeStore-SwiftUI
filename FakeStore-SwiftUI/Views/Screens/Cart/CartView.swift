//
//  CartView.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 31/05/25.
//

import SwiftUI
import FakeStoreCore
struct CartView<ViewModel: CartItemViewModelProtocol & ObservableObject>: View {
    
    @StateObject private var cartItemsViewModel: ViewModel
    
    init(cartItemsViewModel: ViewModel) {
        _cartItemsViewModel = StateObject(wrappedValue: cartItemsViewModel)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cartItemsViewModel.cartItems, id: \.self) { item in
                    CartItemRow(
                        cartItem: item,
                        onIncrease: {
                            cartItemsViewModel.increaseCartItemQuantity(for: item.id)
                            cartItemsViewModel.fetchCartItems()},
                        onDecrease: {
                            cartItemsViewModel.decreaseCartItemQuantity(for: item.id)
                            cartItemsViewModel.fetchCartItems()
                        }
                    )
                }
                .onDelete(perform: deleteItem)
            }// List
            .listStyle(.plain)
            .navigationTitle("FakeStore")
        }//: NavigationList
        .onAppear {
            cartItemsViewModel.fetchCartItems()
        }
    }
    
    //MARK: - Actions
    private func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            let item = cartItemsViewModel.cartItems[index]
            cartItemsViewModel.removeCartItem(id: item.id)
        }
        cartItemsViewModel.fetchCartItems()
    }
}

#Preview {
    CartView(cartItemsViewModel: CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository))
}
