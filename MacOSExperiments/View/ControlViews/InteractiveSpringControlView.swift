//
//  InteractiveSpringControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct InteractiveSpringControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "Interactive spring",
                    description: "A convenience for a spring() animation with a lower response value, intended for driving interactive animations."
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
                    SliderControlView(value: $viewModel.animations.interactiveSpring.response, parameter: InteractiveSpring.responseParameter)
                    
                    SliderControlView(value: $viewModel.animations.interactiveSpring.dampingFraction, parameter: InteractiveSpring.dampingFractionParameter)
                    
                    SliderControlView(value: $viewModel.animations.interactiveSpring.blendDuration, parameter: InteractiveSpring.blendDurationParameter)
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.interactiveSpring.animationOptions)
                }
                
            }
        }
    }
}

struct InteractiveSpringControlView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveSpringControlView(viewModel: AnimationsViewModel())
    }
}
