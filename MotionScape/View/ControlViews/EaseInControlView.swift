//
//  EaseInControlView.swift
//  MotionScape
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct EaseInControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "EaseIn",
                    description: "This pacing causes the animation to start slowly and stop abruptly at the end. It is greater for something that exits the screen. It has the control points (0.42, 0.0) and (1.0, 1.0).",
                    timingCurve: TimingCurve(x0: 0.42, y0: 0.0, x1: 1.0, y1: 1.0)
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
                    SliderControlView(value: $viewModel.animations.easeIn.duration, parameter: EaseIn.durationParameter)
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.easeIn.animationOptions)
                }
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

struct EaseInControlView_Previews: PreviewProvider {
    static var previews: some View {
        EaseInControlView(viewModel: AnimationsViewModel())
    }
}
