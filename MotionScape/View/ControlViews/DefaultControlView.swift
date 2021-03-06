//
//  DefaultControlView.swift
//  MotionScape
//
//  Created by Stefan Blos on 29.03.22.
//

import SwiftUI

struct DefaultControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    @State private var selectedOption: AnimationControlOption = .parameters
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "Default",
                    description: "The default animation that is provided is in fact an easeInOut animation. It has the control points (0.25, 0.1) and (0.25, 1.0).\nUnder the parameters tab below you can see the timing curve for it. Other than that it has no other parameters you can customize.",
                    timingCurve: TimingCurve(x0: 0.25, y0: 0.1, x1: 0.25, y1: 1.0)
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
                    Text("The default animation does not have any parameters to customize. Its goal is to mimic most of the system's animations as close as possible.")
                        .padding()
                    
                case .options:
                    AnimationOptionsView(animationOptions: $viewModel.animations.defaultAnimation.animationOptions)
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

struct DefaultControlView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultControlView(viewModel: AnimationsViewModel())
    }
}
