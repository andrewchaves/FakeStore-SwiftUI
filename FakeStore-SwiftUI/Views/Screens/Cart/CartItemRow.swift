//
//  CartItemRow.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 01/06/25.
//

import SwiftUI
import FakeStoreCore

struct CartItemRow: View {
    
    let cartItem: CartItem
    let onIncrease: () -> Void
    let onDecrease: () -> Void
    
    var body: some View {
        HStack {
            // Product Image
            AsyncImage(
                url: URL(string: cartItem.image ?? ""),
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
            )
            
            Spacer()
            
            //Product Name and Price
            VStack {
                //Product Name
                Text(cartItem.name ?? "")
                    .font(.headline)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                //Product Price
                Text("\(cartItem.price)")
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }//: VStack
            
            Spacer()
            
            //Minus | Plus Component
            VStack {
                Spacer()
                HStack {
                    
                    Button(action: onDecrease) {
                        Image(systemName: "minus.circle")
                    }
                    .buttonStyle(.borderless)
                    
                    Text("\(cartItem.quantity)")
                        .frame(minWidth: 24)
                    
                    Button(action: onIncrease) {
                        Image(systemName: "plus.circle")
                    }
                    .buttonStyle(.borderless)
                }//: HStack
                .padding(.trailing, 4.0)
                .padding(.bottom, 4.0)
            }//: VStack
            
        }//: HStack
        .padding(.vertical, 4)
    }
}

#Preview {
    let cartItemsViewModel = CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository)
    if cartItemsViewModel.cartItems.count > 0 {
        CartItemRow(
            cartItem: cartItemsViewModel.cartItems[0],
            onIncrease: {
                cartItemsViewModel.increaseCartItemQuantity(for: cartItemsViewModel.cartItems[0].id)
                cartItemsViewModel.fetchCartItems()},
            onDecrease: {
                cartItemsViewModel.decreaseCartItemQuantity(for: cartItemsViewModel.cartItems[0].id)
                cartItemsViewModel.fetchCartItems()
            }
        )
    }
}
