//
//  SwiftUIView.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 21/05/25.
//

import SwiftUI

struct GeneralButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button (action: action) {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .cornerRadius(12.0)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    GeneralButton(title: "Sample Text",backgroundColor: .red) {
        print("It works!")
    }
}
