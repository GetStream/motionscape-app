//
//  InterpolatingSpringControlView.swift
//  MotionScape
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
                    headline: NSLocalizedString("Interpolating spring",comment: ""),
                    description: NSLocalizedString("Interpolating spring Description",comment: "")
                )
                
                Picker("", selection: $selectedOption) {
                    ForEach(AnimationControlOption.allCases) { option in
                        Text(NSLocalizedString(option.rawValue.capitalized,comment: ""))
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
                    AnimationOptionsView(animationOptions: $viewModel.animations.interpolatingSpring.animationOptions)
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        // Let's see about that
                        viewModel.resetCurrentAnimation()
                    } label: {
                        Text("Reset to default")
                    }
                    
                    Spacer()
                }
                .padding(.bottom)
            }
        }
    }
}

struct CirclesControlView_Previews: PreviewProvider {
    static var previews: some View {
        InterpolatingSpringControlView(viewModel: AnimationsViewModel())
    }
}
