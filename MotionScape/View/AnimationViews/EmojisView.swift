//
//  EmojisView.swift
//  MotionScape
//
//  Created by Stefan Blos on 18.03.22.
//

import SwiftUI

struct EmojisView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    let letters = Array("😇🥰😝😂😍🤓😜🤭😰🥰😇")
    let lettersAmount = 11
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var textOpacity: CGFloat = 1
    
    var body: some View {
        ZStack {
            ForEach(0 ..< 11) { num in
                Text(String(letters[num]))
                    .font(.largeTitle)
                    .offset(dragAmount)
                    .animation(
                        .create(from: viewModel)
                            .delay(Double(num) / 10),
                        value: dragAmount
                    )
            }
            .scaleEffect(3)
            
            Text("Drag emojis to animate")
                .foregroundColor(.secondary)
                .padding(.top)
                .font(.body)
                .offset(y: 60)
                .opacity(textOpacity)
                .animation(.easeInOut, value: textOpacity)
        }
        
        .padding()
        .gesture(
            DragGesture()
                .onChanged {
                    dragAmount = $0.translation
                    textOpacity = 0
                }
            // _ ignore the value coming in this time
                .onEnded { _ in
                    withAnimation{
                        dragAmount = .zero
                        enabled.toggle()
                    }
                    
                    textOpacity = 1
                }
        )
    }
}

struct EmojisView_Previews: PreviewProvider {
    static var previews: some View {
        EmojisView(viewModel: AnimationsViewModel())
    }
}
