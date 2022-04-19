//
//  TimingCurveControlView.swift
//  MotionScape
//
//  Created by Stefan Blos on 21.03.22.
//

import SwiftUI

struct TimingCurveControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    let textFieldWidth: CGFloat = 100
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "Custom Timing Curve",
                    description: "Manually create the timing curve as shown in the preview below. It is defined via two control points (as depicted in the preview) which are used to draw the curve.")
                
                Picker("", selection: $selectedOption) {
                    ForEach(AnimationControlOption.allCases) { option in
                        Text(option.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                switch selectedOption {
                case .parameters:
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
                    
                    HStack(spacing: 10) {
                        Spacer()
                        
                        Text("Control Point 1:")
                            .foregroundColor(.secondary)
                        
                        TextFieldControlView(value: $viewModel.animations.timingCurve.x0, parameter: TimingCurve.firstControlPointX)
                            .frame(width: textFieldWidth)
                        
                        TextFieldControlView(value: $viewModel.animations.timingCurve.y0, parameter: TimingCurve.firstControlPointY)
                            .frame(width: textFieldWidth)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack(spacing: 10) {
                        Spacer()
                        
                        Text("Control Point 2:")
                            .foregroundColor(.secondary)
                        
                        TextFieldControlView(value: $viewModel.animations.timingCurve.x1, parameter: TimingCurve.secondControlPointX)
                            .frame(width: textFieldWidth)
                        
                        TextFieldControlView(value: $viewModel.animations.timingCurve.y1, parameter: TimingCurve.secondControlPointY)
                            .frame(width: textFieldWidth)
                        
                        Spacer()
                    }
                    
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.timingCurve.animationOptions)
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

struct TimingCurveControlView_Previews: PreviewProvider {
    static var previews: some View {
        TimingCurveControlView(viewModel: AnimationsViewModel())
    }
}
