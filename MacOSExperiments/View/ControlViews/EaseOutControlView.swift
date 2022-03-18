//
//  EaseOutControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct EaseOutControlView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headlineView
                
                Text("Parameters")
                    .font(.headline)
                    .padding(.horizontal)
                
                
                SliderControlView(value: $viewModel.animations.easeOut.duration, parameter: EaseOut.durationParameter)
            }
        }
    }
    
    var headlineView: some View {
        VStack(alignment: .leading) {
            Text("EaseOut")
                .font(.largeTitle)
                .bold()
                .padding([.horizontal, .top])
            
            Text("This pacing is the inverse of ease-in. It speeds up in the beginning and slows down at the end. It is suitable for entrance animations. Think of ease-out in the real world like when a ball is rolled on the floor towards you. You expect the ball’s movement to slow down before it gets to you. It has the control points (0.0,0.0) and (0.58,1.0).")
                .padding()
            
            Divider()
        }
    }
}

struct EaseOutControlView_Previews: PreviewProvider {
    static var previews: some View {
        EaseOutControlView(viewModel: AnimationsViewModel())
    }
}
