//
//  LinearControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct LinearControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "Linear",
                    description: "Linear has no speed changes over the course of the animation. There is nothing like speeding up and slowing down because the animating view moves at a constant speed. It may feel mechanical or robotic, but in some cases, it is the most suitable easing to use over ease in and ease out. It has the control points (0.0, 0.0) and (1.0, 1.0)."
                )
                
                Text("Parameters")
                    .font(.headline)
                    .padding(.horizontal)
                
                
                SliderControlView(value: $viewModel.animations.linear.duration, parameter: Linear.durationParameter)
            }
        }
    }
}

struct LinearControlView_Previews: PreviewProvider {
    static var previews: some View {
        LinearControlView(viewModel: AnimationsViewModel())
    }
}
