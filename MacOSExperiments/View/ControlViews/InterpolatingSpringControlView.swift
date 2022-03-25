//
//  InterpolatingSpringControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

struct InterpolatingSpringControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "Interpolating spring",
                    description: "An interpolating spring animation that uses a damped spring model to produce values in the range [0, 1] that are then used to interpolate within the [from, to] range of the animated property.\nPreserves velocity across overlapping animations by adding the effects of each animation."
                )
                
                Picker("", selection: $selectedOption) {
                    ForEach(AnimationControlOption.allCases) { option in
                        Text(option.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                switch selectedOption {
                case .parameters:
                    SliderControlView(value: $viewModel.animations.interpolatingSpring.stiffness, parameter: InterpolatingSpring.stiffnessParamter)
                    
                    SliderControlView(value: $viewModel.animations.interpolatingSpring.damping, parameter: InterpolatingSpring.dampingParameter)
                    
                    SliderControlView(value: $viewModel.animations.interpolatingSpring.mass, parameter: InterpolatingSpring.massParameter)
                    
                    SliderControlView(value: $viewModel.animations.interpolatingSpring.initialVelocity, parameter: InterpolatingSpring.initialVelocityParameter)
                case .options:
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Options")
                            .font(.headline)
                        
                        ForEach($viewModel.animations.interpolatingSpring.animationOptions) { $option in
                            AnimationOptionView(option: $option)
                        }
                    }
                    .padding()
                }
                
            }
        }
    }
}

struct CirclesControlView_Previews: PreviewProvider {
    static var previews: some View {
        InterpolatingSpringControlView(viewModel: AnimationsViewModel())
    }
}
