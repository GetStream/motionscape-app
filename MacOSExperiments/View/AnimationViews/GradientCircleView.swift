//
//  GradientCircleView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 21.03.22.
//

import SwiftUI

struct GradientCircleView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    @State private var rotationAmount: Double = -90
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Circle()
            .fill(
                AngularGradient(
                    colors: [.blue, .green, .orange, .red, .blue],
                    center: .center
                )
            )
            .scaleEffect(scale)
            .animation(
                .create(from: viewModel)
                    .repeatForever(autoreverses: true),
                value: scale
            )
            .rotationEffect(.degrees(rotationAmount))
            .animation(
                .create(from: viewModel)
                    .repeatForever(autoreverses: true),
                value: rotationAmount
            )
            .overlay(Circle().stroke(Color.primary.opacity(0.6), lineWidth: 3))
            .padding(40)
            .onAppear {
                rotationAmount += 360
                scale = 0.5
            }
    }
}

struct GradientCircleView_Previews: PreviewProvider {
    static var previews: some View {
        GradientCircleView(viewModel: AnimationsViewModel())
    }
}
