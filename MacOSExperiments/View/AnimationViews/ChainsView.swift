//
//  ChainsView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 18.03.22.
//

import SwiftUI

struct ChainsView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    let letters = Array(repeating: "🔗", count: 25)
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0 ..< 25) { num in
                Text(String(letters[num]))
                    .padding(-10)
                    .font(.largeTitle)
                    .rotationEffect(.degrees(enabled ? 0 : 360), anchor: .bottom)
                    .offset(dragAmount)
                    .animation(
                        .create(from: viewModel)
                            .delay(Double(num) / 20),
                        value: dragAmount
                    )
            }
        }
        .padding()
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
            // _ ignore the value coming in this time
                .onEnded { _ in
                    withAnimation{
                        dragAmount = .zero
                        enabled.toggle()
                    }
                }
        )
    }
}

struct ChainsView_Previews: PreviewProvider {
    static var previews: some View {
        ChainsView(viewModel: AnimationsViewModel())
    }
}
