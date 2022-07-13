//
//  EaseIn.swift
//  MotionScape
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct EaseIn: Equatable {
    var duration: Double = 1
    
    var name = NSLocalizedString("EaseIn",comment: "")
    
    var animationOptions: [AnimationOption] = [
        .createDelay(),
        .createSpeed()
    ]
}

extension EaseIn: MyAnimation {
    
    func createCodeSnippet() -> String {
        let animationString = """
.easeIn(
    duration: \(duration.stringWith(places: codePreviewDecimalPlaces))
)
"""
        
        return addAnimationOptions(to: animationString)
    }
    
    func createAnimation() -> Animation {
        return .easeIn(
            duration: duration
        )
        .speed(getSpeed())
        .delay(getDelay())
    }
}

extension EaseIn {
    
    // Parameter
    static let durationParameter = AnimationParameter(
        name: NSLocalizedString("Duration",comment: ""),
        description: NSLocalizedString("The duration of the animation.",comment: ""),
        range: 0 ... 10)
}
