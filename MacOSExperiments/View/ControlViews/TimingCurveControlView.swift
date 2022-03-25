//
//  TimingCurveControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 21.03.22.
//

import SwiftUI

struct TimingCurveControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "Timing Curve",
                    description: "TBD")
                
                Text("Preview")
                    .font(.headline)
                    .padding(.horizontal)
                HStack {
                    Spacer()
                TimingCurveView(
                    timingCurve: viewModel.animations.timingCurve
                )
                .frame(width: 200, height: 200)
                    
                    Spacer()
                }
                
                Picker("", selection: $selectedOption) {
                    ForEach(AnimationControlOption.allCases) { option in
                        Text(option.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                switch selectedOption {
                case .parameters:
                    SliderControlView(value: $viewModel.animations.timingCurve.x0, parameter: TimingCurve.firstControlPointX)
                    
                    SliderControlView(value: $viewModel.animations.timingCurve.y0, parameter: TimingCurve.firstControlPointY)
                    
                    SliderControlView(value: $viewModel.animations.timingCurve.x1, parameter: TimingCurve.secondControlPointX)
                    
                    SliderControlView(value: $viewModel.animations.timingCurve.y1, parameter: TimingCurve.secondControlPointY)
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.timingCurve.animationOptions)
                }
            }
        }
    }
}

struct TimingCurveControlView_Previews: PreviewProvider {
    static var previews: some View {
        TimingCurveControlView(viewModel: AnimationsViewModel())
    }
}
