//
//  CartItemRow.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 01/06/25.
//

import SwiftUI
import FakeStoreCore

struct CartItemRow<ViewModel: CartItemViewModelProtocol & ObservableObject>: View {
    
    //@ObservedObject var cartItem: CartItem
    var cartItemId: Int64
    var cartItemIdx: Int
    @ObservedObject var cartItemsViewModel: ViewModel
    
    init(cartItemId: Int64, cartItemsViewModel: ViewModel) {
        self.cartItemsViewModel = cartItemsViewModel
        self.cartItemId = cartItemId
        cartItemIdx = cartItemsViewModel.cartItems.firstIndex(where: { $0.id ==  self.cartItemId})!
    }
    
    var body: some View {
        HStack (alignment: .top){
            // Product Image
            AsyncImage(
                url: URL(string: cartItemsViewModel.cartItems[cartItemIdx].image ?? ""),
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
                Text(cartItemsViewModel.cartItems[cartItemIdx].name ?? "")
                    .font(.headline)
                    .lineLimit(2)
                Text("$\(cartItemsViewModel.cartItems[cartItemIdx].price)") //TODO: - Make the real processing of price.
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
            }
            
            Spacer()
            // Quantity up and down component
            VStack {
                Spacer()
                HStack(spacing: 24) {
                    
                    //Minus button
                    Button(action: {
                        cartItemsViewModel.decreaseCartItemQuantity(for: cartItemsViewModel.cartItems[cartItemIdx].id)
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    
                    //Quantity text
                    Text("\(cartItemsViewModel.cartItems[cartItemIdx].quantity)")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    //Plus Button
                    Button(action: {
                        cartItemsViewModel.increaseCartItemQuantity(for: cartItemsViewModel.cartItems[cartItemIdx].id)
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
            }//: VStack
        }
        .padding(.vertical, 4.0)
    }
}

#Preview {
//TODO: - Refactor preview
//    let cartItemVM = CartItemVM(cartItemRepository: AppContainer.shared.cartItemRepository)
//    if cartItemVM.cartItems.count > 0 {
//        CartItemRow(cartItem: cartItemVM.cartItems[0])
//    }
}
