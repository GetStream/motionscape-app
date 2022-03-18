//
//  InterpolatingSpringControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

struct InterpolatingSpringControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headlineView
                
                Text("Parameters")
                    .font(.headline)
                    .padding(.horizontal)
                
                
                SliderControlView(value: $viewModel.animations.interpolatingSpring.stiffness, parameter: InterpolatingSpring.stiffnessParamter)
                
                
                SliderControlView(value: $viewModel.animations.interpolatingSpring.damping, parameter: InterpolatingSpring.dampingParameter)
                
                SliderControlView(value: $viewModel.animations.interpolatingSpring.mass, parameter: InterpolatingSpring.massParameter)
                
                SliderControlView(value: $viewModel.animations.interpolatingSpring.initialVelocity, parameter: InterpolatingSpring.initialVelocityParameter)
            }
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
        InterpolatingSpringControlView(viewModel: AnimationsViewModel())
    }
}
