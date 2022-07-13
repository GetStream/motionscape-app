//
//  EaseInOutControlView.swift
//  MotionScape
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
                    headline: NSLocalizedString("EaseInOut",comment: ""),
                    description: NSLocalizedString("EaseInOut Description",comment: ""),
                    timingCurve: TimingCurve(x0: 0.42, y0: 0.0, x1: 0.58, y1: 1.0)
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
                    SliderControlView(value: $viewModel.animations.easeInOut.duration, parameter: EaseInOut.durationParameter)
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.easeInOut.animationOptions)
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

struct EaseInOutControlView_Previews: PreviewProvider {
    static var previews: some View {
        EaseInOutControlView(viewModel: AnimationsViewModel())
    }
}
