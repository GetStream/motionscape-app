//
//  Animation+Create.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

extension Animation {
    static func create(from viewModel: CirclesViewModel) -> Animation {
        switch viewModel.animation {
        case .interpolatingSpring:
            return .interpolatingSpring(
                mass: viewModel.interpolatingSpring.mass,
                stiffness: viewModel.interpolatingSpring.stiffness,
                damping: viewModel.interpolatingSpring.damping,
                initialVelocity: viewModel.interpolatingSpring.initialVelocity
            )
        case .interactiveSpring:
            return .interactiveSpring(
                response: viewModel.interactiveSpring.response,
                dampingFraction: viewModel.interactiveSpring.dampingFraction,
                blendDuration: viewModel.interactiveSpring.blendDuration
            )
        }
    }
}
