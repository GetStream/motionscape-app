//
//  CustomTextFieldStyle.swift
//  MotionScape
//
//  Created by Stefan Blos on 02.05.23.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    
    var isFocused: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            Color(.blue)
                .clipShape(Capsule())
                
            
            configuration
                .textFieldStyle(.plain)
                .font(.title2)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                .background(.thinMaterial, in: Capsule())
            
            if isFocused {
                Capsule()
                    .stroke(Color.white.opacity(0.7), lineWidth: 4)
            }
        }
        .frame(height: 40)
        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}
