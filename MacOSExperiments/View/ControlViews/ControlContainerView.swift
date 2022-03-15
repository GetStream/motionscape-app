//
//  ControlContainerView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct ControlContainerView: View {
    
    @ObservedObject var viewModel: CirclesViewModel
    
    var body: some View {
        switch viewModel.animation {
        case .interpolatingSpring:
            InterpolatingSpringControlView(viewModel: viewModel)
        case .interactiveSpring:
            InteractiveSpringControlView(viewModel: viewModel)
        }
    }
}

struct ControlContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ControlContainerView(viewModel: CirclesViewModel())
    }
}
