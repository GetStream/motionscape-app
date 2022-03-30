//
//  CustomModifiers.swift
//  MotionScape
//
//  Created by Stefan Blos on 24.03.22.
//

import SwiftUI

struct ValueLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 60)
            .font(.title2)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            
    }
}

extension View {
    func valueLabel() -> some View {
        modifier(ValueLabel())
    }
}
