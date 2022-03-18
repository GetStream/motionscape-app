//
//  EaseInControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct EaseInControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headlineView
                
                Text("Parameters")
                    .font(.headline)
                    .padding(.horizontal)
                
                
                SliderControlView(value: $viewModel.animations.easeIn.duration, parameter: EaseIn.durationParameter)
            }
        }
    }
    
    var headlineView: some View {
        VStack(alignment: .leading) {
            Text("EaseIn")
                .font(.largeTitle)
                .bold()
                .padding([.horizontal, .top])
            
            Text("This pacing causes the animation to start slowly and stop abruptly at the end. It is greater for something that exits the screen. It has the control points (0.42, 0.0) and (1.0, 1.0).")
                .padding()
            
            Divider()
        }
    }
}

struct EaseInControlView_Previews: PreviewProvider {
    static var previews: some View {
        EaseInControlView(viewModel: AnimationsViewModel())
    }
}
