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
            
            Text(cartItem.name ?? "")
                .font(.headline)
                .lineLimit(1)
            
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
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    //TODO: - Refactor preview
    //    let cartItemVM = CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository)
    //    if cartItemVM.cartItems.count > 0 {
    //        CartItemRow(cartItem: cartItemVM.cartItems[0])
    //    }
}
