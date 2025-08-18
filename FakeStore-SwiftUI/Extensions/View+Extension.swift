//
//  View+Extension.swift
//  FakeStore-SwiftUI
//
//  Created by Andrew Vale on 18/08/25.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func hideScrollIndicatorsIfAvailable() -> some View {
        if #available(iOS 16, *) {
            self.scrollIndicators(.hidden)
        } else {
            self
        }
    }
}
