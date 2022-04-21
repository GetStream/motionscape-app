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
                    Text("Brought to you by".uppercased())
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
            
            Text("We love creating helpful things for developers. And we love animations. Playing around to finetune them and find just the right setting to make it awesome is what we really enjoy.")
                .multilineTextAlignment(.leading)
                .frame(minHeight: 50, maxHeight: .infinity)
            
            Text("So we thought that an application to do just that would be perfect. We hope you like MotionScape as well as we do.")
                .multilineTextAlignment(.leading)
                .frame(minHeight: 40, maxHeight: .infinity)
            
            Text("If you enjoy the app then please consider giving it a review on the App Store. You should also go to the repo once it's open-source and give it a star.")
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
