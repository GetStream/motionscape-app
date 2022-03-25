//
//  Animation+Create.swift
//  MotionScape
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
            return viewModel.animations.spring.createAnimation()
        case .linear:
            return viewModel.animations.linear.createAnimation()
        case .easeIn:
            return viewModel.animations.easeIn.createAnimation()
        case .easeOut:
            return viewModel.animations.easeOut.createAnimation()
        case .easeInOut:
            return viewModel.animations.easeInOut.createAnimation()
        case .timingCurve:
            return viewModel.animations.timingCurve.createAnimation()
        case .none:
            fatalError("No animation was selected and that's not a valid use-case!")
        }
    }
}
