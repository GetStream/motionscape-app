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
            
            Text("If you enjoy the app then please consider giving it a review on the App Store. You should also go the repo (did you know it's all open source?) and give it a star.")
                .multilineTextAlignment(.leading)
                .frame(minHeight: 50, maxHeight: .infinity)
            
            Text("What?")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("At Stream we create the world's number 1 chat SDK with solutions for every platform there is. We offer native solutions (iOS, Android) as well as ones for cross-platform frameworks (Flutter, React Native).")
                .multilineTextAlignment(.leading)
                .frame(minHeight: 50, maxHeight: .infinity)
            
            Text("We also have solutions for the Web and get your apps and sites up and running with chat in days rather than months if you build it yourself.")
                .multilineTextAlignment(.leading)
                .frame(minHeight: 40, maxHeight: .infinity)
            
            HStack(spacing: 0) {
                Text("Go to ")
                
                Link("getstream.io",
                  destination: URL(string: "https://getstream.io")!)
            
                Text(" and sign up for your free Maker account.")
            }
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
