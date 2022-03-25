//
//  EaseInOut.swift
//  MotionScape
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct EaseInOut: Equatable {
    var duration: Double = 1
    
    var name = "EaseInOut"
    
    var animationOptions: [AnimationOption] = [
        .createDelay(),
        .createSpeed()
    ]
}

extension EaseInOut: MyAnimation {
    
    func createCodeSnippet() -> String {
        let animationString = """
.easeInOut(
    duration: \(duration)
)
"""
        
        return addAnimationOptions(to: animationString)
    }
    
    func createAnimation() -> Animation {
        return .easeInOut(
            duration: duration
        )
        .speed(getSpeed())
        .delay(getDelay())
    }
}

extension EaseInOut {
    
    // Parameter
    static let durationParameter = AnimationParameter(
        name: "Duration",
        description: "The duration of the animation.",
        range: 0 ... 10)
}
