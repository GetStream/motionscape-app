//
//  EaseOut.swift
//  MotionScape
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct EaseOut: Equatable {
    var duration: Double = 1
    
    var name = "EaseOut"
    
    var animationOptions: [AnimationOption] = [
        .createDelay(),
        .createSpeed()
    ]
}

extension EaseOut: MyAnimation {
    
    func createCodeSnippet() -> String {
        let animationString = """
.easeOut(
    duration: \(duration.stringWith(places: codePreviewDecimalPlaces))
)
"""
        
        return addAnimationOptions(to: animationString)
    }
    
    func createAnimation() -> Animation {
        return .easeOut(
            duration: duration
        )
        .speed(getSpeed())
        .delay(getDelay())
    }
}

extension EaseOut {
    
    // Parameter
    static let durationParameter = AnimationParameter(
        name: "Duration",
        description: "The duration of the animation.",
        range: 0 ... 10)
}
