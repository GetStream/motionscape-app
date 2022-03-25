//
//  Animation+Create.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

extension Animation {
    static func create(from viewModel: AnimationsViewModel) -> Animation {
        switch viewModel.selectedAnimation {
        case .interpolatingSpring:
            return viewModel.animations.interpolatingSpring.createAnimation()
        case .interactiveSpring:
            return viewModel.animations.interactiveSpring.createAnimation()
        case .spring:
            return .spring(
                response: viewModel.animations.spring.response,
                dampingFraction: viewModel.animations.spring.dampingFraction,
                blendDuration: viewModel.animations.spring.blendDuration
            )
        case .linear:
            return .linear(
                duration: viewModel.animations.linear.duration
            )
        case .easeIn:
            return .easeIn(
                duration: viewModel.animations.easeIn.duration
            )
        case .easeOut:
            return .easeOut(
                duration: viewModel.animations.easeOut.duration
            )
        case .easeInOut:
            return .easeInOut(
                duration: viewModel.animations.easeInOut.duration
            )
        case .timingCurve:
            return .timingCurve(
                viewModel.animations.timingCurve.x0,
                viewModel.animations.timingCurve.y0,
                viewModel.animations.timingCurve.x1,
                viewModel.animations.timingCurve.y1
            )
            .speed(0.5)
        case .none:
            fatalError("No animation was selected and that's not a valid use-case!")
        }
    }
}
