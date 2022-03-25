//
//  EaseInOutControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct EaseInOutControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "EaseInOut",
                    description: "It combines ease-in and ease-out pacing. This pacing causes an animation to start slowly, speed up in the middle and slow down again before it completes. Make it your great choice for point-to-point (back-and-forth) movement on the screen. It has the control points (0.42,0.0) and (0.58,1.0)."
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
                    SliderControlView(value: $viewModel.animations.easeInOut.duration, parameter: EaseInOut.durationParameter)
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.easeInOut.animationOptions)
                }
            }
        }
    }
}

struct EaseInOutControlView_Previews: PreviewProvider {
    static var previews: some View {
        EaseInOutControlView(viewModel: AnimationsViewModel())
    }
}
