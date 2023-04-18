//
//  TextAnimationView.swift
//  MotionScape
//
//  Created by Stefan Blos on 18.04.23.
//

import SwiftUI

struct TextAnimationView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    var text = "Motionscape👀"
    
    @State private var offset: CGFloat = 0
    
    var body: some View {
        HStack {
            ForEach(Array(text.enumerated()), id: \.offset) { (index, character) in
                Text(String(character))
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .offset(x: 0, y: offset)
                    .animation(
                        .create(from: viewModel)
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
        TextAnimationView(viewModel: AnimationsViewModel())
    }
}
