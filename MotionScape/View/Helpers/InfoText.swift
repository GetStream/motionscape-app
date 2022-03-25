//
//  InfoText.swift
//  MotionScape
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct InfoText: View {
    
    var text: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Image(systemName: "info.circle")
            
            Text("\(text)")
        }
        .padding()
        .background(Color(.textBackgroundColor))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.secondary.opacity(0.3), lineWidth: 2)
        )
    }
}

struct InfoText_Previews: PreviewProvider {
    static var previews: some View {
        InfoText(text: "The stiffness of the spring.")
    }
}
