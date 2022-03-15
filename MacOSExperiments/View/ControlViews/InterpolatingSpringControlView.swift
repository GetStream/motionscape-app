//
//  InterpolatingSpringControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

struct InterpolatingSpringControlView: View {
    
    @ObservedObject var viewModel: CirclesViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headlineView
                
                Text("Parameters")
                    .font(.headline)
                    .padding(.horizontal)
                
                
                SliderControlView(value: $viewModel.interpolatingSpring.stiffness, range: 0.1 ... 200, name: "Stiffness", description: "The stiffness of the spring.")
                
                SliderControlView(value: $viewModel.interpolatingSpring.damping, range: 0.1 ... 50, name: "Damping", description: "The spring damping value.")
                
                SliderControlView(value: $viewModel.interpolatingSpring.mass, range: 0.1 ... 100, name: "Mass", description: "The mass of the object attached to the spring.")
                
                SliderControlView(value: $viewModel.interpolatingSpring.initialVelocity, range: 0 ... 10, name: "Initial velocity", description: "The initial velocity of the spring, as a value in the range [0, 1] representing the magnitude of the value being animated.")
            }
        }
        .onAppear {
            viewModel.animation = .interpolatingSpring
        }
    }
    
    var headlineView: some View {
        VStack(alignment: .leading) {
            Text("Interpolating spring")
                .font(.largeTitle)
                .bold()
                .padding([.horizontal, .top])
            
            Text("An interpolating spring animation that uses a damped spring model to produce values in the range [0, 1] that are then used to interpolate within the [from, to] range of the animated property.\nPreserves velocity across overlapping animations by adding the effects of each animation.")
                .padding()
            
            Divider()
        }
    }
}

struct CirclesControlView_Previews: PreviewProvider {
    static var previews: some View {
        InterpolatingSpringControlView(viewModel: CirclesViewModel())
    }
}
