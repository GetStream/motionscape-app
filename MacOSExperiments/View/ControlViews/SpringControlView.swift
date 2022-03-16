//
//  SpringControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct SpringControlView: View {
    
    @ObservedObject var viewModel: CirclesViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headlineView
                
                Text("Parameters")
                    .font(.headline)
                    .padding(.horizontal)
                
                
                SliderControlView(value: $viewModel.spring.response, range: 0 ... 1, name: "Response", description: "The stiffness of the spring, defined as an approximate duration in seconds. A value of zero requests an infinitely-stiff spring, suitable for driving interactive animations.")
                
                SliderControlView(value: $viewModel.spring.dampingFraction, range: 0 ... 1, name: "Damping fraction", description: "The amount of drag applied to the value being animated, as a fraction of an estimate of amount needed to produce critical damping.")
                
                SliderControlView(value: $viewModel.spring.blendDuration, range: 0 ... 1, name: "Blend duration", description: "The duration in seconds over which to interpolate changes to the response value of the spring.")
            }
        }
    }
    
    var headlineView: some View {
        VStack(alignment: .leading) {
            Text("Spring")
                .font(.largeTitle)
                .bold()
                .padding([.horizontal, .top])
            
            Text("A persistent spring animation. When mixed with other spring() or interactiveSpring() animations on the same property, each animation will be replaced by their successor, preserving velocity from one animation to the next. Optionally blends the response values between springs over a time period.")
                .padding()
            
            Divider()
        }
    }
}

struct SpringControlView_Previews: PreviewProvider {
    static var previews: some View {
        SpringControlView(viewModel: CirclesViewModel())
    }
}
