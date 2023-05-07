//
//  Modifiers.swift
//  Course App
//
//  Created by SKUBI on 06/04/23.
//

import SwiftUI

struct ShadowModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
    }
}
