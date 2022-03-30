//
//  LinearControlView.swift
//  MotionScape
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct LinearControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "Linear",
                    description: "Linear has no speed changes over the course of the animation. There is nothing like speeding up and slowing down because the animating view moves at a constant speed. It may feel mechanical or robotic, but in some cases, it is the most suitable easing to use over ease in and ease out. It has the control points (0.0, 0.0) and (1.0, 1.0)."
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
                    SliderControlView(value: $viewModel.animations.linear.duration, parameter: Linear.durationParameter)
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.linear.animationOptions)
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
            }
        }
    }
}

struct LinearControlView_Previews: PreviewProvider {
    static var previews: some View {
        LinearControlView(viewModel: AnimationsViewModel())
    }
}
