//
//  ControlContainerView.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct ControlContainerView: View {
    
    @ObservedObject var viewModel: AnimationsViewModel
    
    var body: some View {
        switch viewModel.selectedAnimation {
        case .interpolatingSpring:
            InterpolatingSpringControlView(viewModel: viewModel)
        case .interactiveSpring:
            InteractiveSpringControlView(viewModel: viewModel)
        case .spring:
            SpringControlView(viewModel: viewModel)
        case .linear:
            LinearControlView(viewModel: viewModel)
        case .easeIn:
            EaseInControlView(viewModel: viewModel)
        case .easeOut:
            EaseOutControlView(viewModel: viewModel)
        case .easeInOut:
            EaseInOutControlView(viewModel: viewModel)
        case .none:
            Text("No animation type selected.")
        }
    }
}

struct ControlContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ControlContainerView(viewModel: AnimationsViewModel())
    }
}
