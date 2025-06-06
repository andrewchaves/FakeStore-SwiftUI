//
//  CartItemRow.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 01/06/25.
//

import SwiftUI
import FakeStoreCore

struct CartItemRow: View {
    
    @State var quantity: Int = 0
    
    var cartItem: CartItem
    
    var body: some View {
        HStack (alignment: .top){
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
            
            // Product name and price
            VStack (alignment: .leading, spacing: 5.0){
                Text(cartItem.name ?? "")
                    .font(.headline)
                    .lineLimit(2)
                Text("$\(cartItem.price)") //TODO: - Make the real processing of price.
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
            }
            
            Spacer()
            // Quantity up and down component
            VStack {
                Spacer()
                HStack(spacing: 24) {
                    Button(action: {
                        if quantity > 0 {
                            quantity -= 1
                        }
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    
                    Text("\(quantity)")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        quantity += 1
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
                .padding(.trailing, 4.0)
                .padding(.bottom, 4.0)
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
