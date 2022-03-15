//
//  InteractiveSpringControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct InteractiveSpringControlView: View {
    
    @ObservedObject var viewModel: CirclesViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headlineView
                
                Text("Parameters")
                    .font(.headline)
                    .padding(.horizontal)
                
                
                SliderControlView(value: $viewModel.interactiveSpring.response, range: 0 ... 1, name: "Response", description: "No description available.")
                
                SliderControlView(value: $viewModel.interactiveSpring.dampingFraction, range: 0 ... 1, name: "Damping fraction", description: "No description available.")
                
                SliderControlView(value: $viewModel.interactiveSpring.blendDuration, range: 0 ... 1, name: "Blend duration", description: "No description available.")
            }
        }
        .onAppear {
            viewModel.animation = .interactiveSpring
        }
    }
    
    var headlineView: some View {
        VStack(alignment: .leading) {
            Text("Interactive spring")
                .font(.largeTitle)
                .bold()
                .padding([.horizontal, .top])
            
            Text("A convenience for a spring() animation with a lower response value, intended for driving interactive animations.")
                .padding()
            
            Divider()
        }
    }
}

struct InteractiveSpringControlView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveSpringControlView(viewModel: CirclesViewModel())
    }
}
