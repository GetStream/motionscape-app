//
//  InteractiveSpringControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct InteractiveSpringControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeadlineView(
                    headline: "Interactive spring",
                    description: "A convenience for a spring() animation with a lower response value, intended for driving interactive animations."
                )
                
                Text("Parameters")
                    .font(.headline)
                    .padding(.horizontal)
                
                
                SliderControlView(value: $viewModel.animations.interactiveSpring.response, parameter: InteractiveSpring.responseParameter)
                
                SliderControlView(value: $viewModel.animations.interactiveSpring.dampingFraction, parameter: InteractiveSpring.dampingFractionParameter)
                
                SliderControlView(value: $viewModel.animations.interactiveSpring.blendDuration, parameter: InteractiveSpring.blendDurationParameter)
            }
        }
    }
}

struct InteractiveSpringControlView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveSpringControlView(viewModel: AnimationsViewModel())
    }
}
