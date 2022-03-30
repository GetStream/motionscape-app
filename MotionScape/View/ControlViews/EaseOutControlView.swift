//
//  EaseOutControlView.swift
//  MotionScape
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct EaseOutControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "EaseOut",
                    description: "This pacing is the inverse of ease-in. It speeds up in the beginning and slows down at the end. It is suitable for entrance animations. Think of ease-out in the real world like when a ball is rolled on the floor towards you. You expect the ball’s movement to slow down before it gets to you. It has the control points (0.0, 0.0) and (0.58, 1.0).",
                    timingCurve: TimingCurve(x0: 0.0, y0: 0.0, x1: 0.58, y1: 1.0)
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
                    SliderControlView(value: $viewModel.animations.easeOut.duration, parameter: EaseOut.durationParameter)
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.easeOut.animationOptions)
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

struct EaseOutControlView_Previews: PreviewProvider {
    static var previews: some View {
        EaseOutControlView(viewModel: AnimationsViewModel())
    }
}
