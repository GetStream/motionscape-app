//
//  InteractiveSpringControlView.swift
//  MotionScape
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
                    headline: NSLocalizedString("Interactive spring",comment: ""),
                    description: NSLocalizedString("Interactive spring Description",comment: "")
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
                    SliderControlView(value: $viewModel.animations.interactiveSpring.response, parameter: InteractiveSpring.responseParameter)
                    
                    SliderControlView(value: $viewModel.animations.interactiveSpring.dampingFraction, parameter: InteractiveSpring.dampingFractionParameter)
                    
                    SliderControlView(value: $viewModel.animations.interactiveSpring.blendDuration, parameter: InteractiveSpring.blendDurationParameter)
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.interactiveSpring.animationOptions)
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

struct InteractiveSpringControlView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveSpringControlView(viewModel: AnimationsViewModel())
    }
}
