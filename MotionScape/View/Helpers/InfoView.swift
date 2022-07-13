//
//  InfoView.swift
//  MotionScape
//
//  Created by Stefan Blos on 29.03.22.
//

import SwiftUI

struct InfoView: View {
    @State private var textOpacity = 0.0
    @State private var logoOffsetX: CGFloat = -500
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack(alignment: .leading) {
                    Text(NSLocalizedString("Brought to you by".uppercased(),comment: ""))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Stream")
                        .font(.largeTitle)
                }
                .opacity(textOpacity)
                
                Spacer()
                
                Image("stream-logo")
                    .offset(x: logoOffsetX)
            }
            
            Text("Why?")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Info Content 1")
                .multilineTextAlignment(.leading)
                .frame(minHeight: 50, maxHeight: .infinity)
            
            Text("Info Content 2")
                .multilineTextAlignment(.leading)
                .frame(minHeight: 40, maxHeight: .infinity)
            
            Text("Info Content 3")
                .multilineTextAlignment(.leading)
                .frame(minHeight: 50, maxHeight: .infinity)
            
        }
        .padding()
        .frame(maxWidth: 500)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.8)) {
                textOpacity = 1
            }
            
            withAnimation(.spring().speed(0.7)) {
                logoOffsetX = 0
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environment(\.sizeCategory, .accessibilityExtraLarge)
    }
}
