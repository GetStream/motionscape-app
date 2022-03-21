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
    
    var body: some View {
        Circle()
            .fill(
                AngularGradient(
                    colors: [.blue, .green, .orange, .red, .blue],
                    center: .center
                )
            )
            .rotationEffect(.degrees(rotationAmount))
            .animation(
                .create(from: viewModel)
                .repeatForever(autoreverses: false),
                value: rotationAmount
            )
            .padding(40)
            .onAppear {
                rotationAmount += 360
            }
    }
}

struct GradientCircleView_Previews: PreviewProvider {
    static var previews: some View {
        GradientCircleView(viewModel: AnimationsViewModel())
    }
}
