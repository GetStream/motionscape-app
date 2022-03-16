//
//  EaseOutControlView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct EaseOutControlView: View {
    
    @ObservedObject var viewModel: CirclesViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headlineView
                
                Text("Parameters")
                    .font(.headline)
                    .padding(.horizontal)
                
                
                SliderControlView(value: $viewModel.easeOut.duration, range: 0.01 ... 20, name: "Duration", description: "The duration of the animation.")
            }
        }
    }
    
    var headlineView: some View {
        VStack(alignment: .leading) {
            Text("EaseOut")
                .font(.largeTitle)
                .bold()
                .padding([.horizontal, .top])
            
            Text("No description available yet.")
                .padding()
            
            Divider()
        }
    }
}

struct EaseOutControlView_Previews: PreviewProvider {
    static var previews: some View {
        EaseOutControlView(viewModel: CirclesViewModel())
    }
}
