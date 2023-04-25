//
//  TextAnimationView.swift
//  MotionScape
//
//  Created by Stefan Blos on 18.04.23.
//

import SwiftUI

struct TextAnimationContainer: View {
    @ObservedObject var viewModel: AnimationsViewModel
    
    @State private var text = "Motionscape👀"
    
    var body: some View {
        VStack {
            TextField("Your custom text:", text: $text)
                .padding(40)
            
            Spacer()
            
            TextAnimationView(text: text, animation: .create(from: viewModel))
                .id(viewModel.id)
            
            Spacer()
        }
        .onChange(of: text) { _ in
            viewModel.id = UUID()
        }
        
    }
}

struct TextAnimationView: View {
    
    @State private var offset: CGFloat = 0
    
    var text: String
    var animation: Animation
    
    var body: some View {
        HStack {
            ForEach(Array(text.enumerated()), id: \.offset) { (index, character) in
                Text(String(character))
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .offset(x: 0, y: offset)
                    .animation(
                        animation
                        .repeatForever(autoreverses: true)
                        .delay(Double(index) / 30),
                        value: offset
                    )
            }
        }
        
        .onAppear {
            withAnimation {
                offset = 100
            }
        }
    }
}

struct TextAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TextAnimationView(text: "Motionscape", animation: .easeInOut)
    }
}
