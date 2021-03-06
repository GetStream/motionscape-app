//
//  SpringControlView.swift
//  MotionScape
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct SpringControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "Spring",
                    description: "A persistent spring animation. When mixed with other spring() or interactiveSpring() animations on the same property, each animation will be replaced by their successor, preserving velocity from one animation to the next. Optionally blends the response values between springs over a time period."
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
                    SliderControlView(value: $viewModel.animations.spring.response, parameter: Spring.responseParameter)
                    
                    SliderControlView(value: $viewModel.animations.spring.dampingFraction, parameter: Spring.dampingFractionParameter)
                    
                    SliderControlView(value: $viewModel.animations.spring.blendDuration, parameter: Spring.blendDurationParameter)
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.spring.animationOptions)
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

struct SpringControlView_Previews: PreviewProvider {
    static var previews: some View {
        SpringControlView(viewModel: AnimationsViewModel())
    }
}
