//
//  CartView.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 31/05/25.
//

import SwiftUI
import FakeStoreCore
struct CartView<ViewModel: CartItemViewModelProtocol & ObservableObject>: View {
    
    @ObservedObject private var carItensViewModel: ViewModel
    
    init(cartItensViewModel: ViewModel) {
        self.carItensViewModel = cartItensViewModel
    }
    
    var body: some View {
        NavigationView {
            List (carItensViewModel.cartItems){ cartItem in
                CartItemRow(cartItemId: cartItem.id, cartItemsViewModel: carItensViewModel)
            }
            .listStyle(.plain)
            .navigationTitle("FakeStore")
        }
        .onAppear {
            carItensViewModel.fetchCartItems()
        }
    }
}

#Preview {
    CartView(cartItensViewModel: CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository))
}
