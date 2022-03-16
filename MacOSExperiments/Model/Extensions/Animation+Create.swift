//
//  Animation+Create.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

extension Animation {
    static func create(from viewModel: CirclesViewModel) -> Animation {
        switch viewModel.selectedAnimation {
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
        case .spring:
            return .spring(
                response: viewModel.spring.response,
                dampingFraction: viewModel.spring.dampingFraction,
                blendDuration: viewModel.spring.blendDuration
            )
        case .linear:
            return .linear(
                duration: viewModel.linear.duration
            )
        case .easeIn:
            return .easeIn(
                duration: viewModel.easeIn.duration
            )
        case .easeOut:
            return .easeOut(
                duration: viewModel.easeOut.duration
            )
        case .easeInOut:
            return .easeInOut(
                duration: viewModel.easeInOut.duration
            )
        case .none:
            fatalError("No animation was selected and that's not a valid use-case!")
        }
    }
}
