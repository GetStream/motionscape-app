//
//  AnimationType.swift
//  MotionScape
//
//  Created by Stefan Blos on 14.03.22.
//

import Foundation

enum AnimationType: String, Equatable {
    case interpolatingSpring = "Interpolating Spring"
    case interactiveSpring = "Interactive Spring"
    case spring = "Spring"
    case linear = "Linear"
    case defaultAnimation = "Default"
    case easeIn = "Ease In"
    case easeOut = "Ease Out"
    case easeInOut = "Ease In Out"
    case timingCurve = "Timing Curve"
}
