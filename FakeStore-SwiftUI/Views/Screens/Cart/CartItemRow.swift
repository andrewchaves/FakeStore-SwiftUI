//
//  CartItemRow.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 01/06/25.
//

import SwiftUI
import FakeStoreCore

struct CartItemRow: View {
    var cartItem: CartItem
    var body: some View {
        HStack (alignment: .top){
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
            
            VStack (alignment: .leading, spacing: 5.0){
                Text(cartItem.name ?? "")
                    .font(.headline)
                    .lineLimit(2)
                Text("$\(cartItem.price)") //TODO: - Make the real processing of price.
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4.0)
    }
}

#Preview {
    let cartItemVM = CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository)
    if cartItemVM.cartItems.count > 0 {
        CartItemRow(cartItem: cartItemVM.cartItems[0])
    }
}
