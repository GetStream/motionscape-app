//
//  InteractiveSpring.swift
//  MotionScape
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct InteractiveSpring: Equatable {
    
    var name = "Interactive Spring"
    
    var response: Double = 0.15
    var dampingFraction: Double = 0.86
    var blendDuration: Double = 0.25
    
    var animationOptions: [AnimationOption] = [
        .createDelay()
    ]
}

extension InteractiveSpring: MyAnimation {
    
    func createCodeSnippet() -> String {
        let animationString = """
.interactiveSpring(
    response: \(response.stringWith(places: codePreviewDecimalPlaces)),
    dampingFraction: \(dampingFraction.stringWith(places: codePreviewDecimalPlaces)),
    blendDuration: \(blendDuration.stringWith(places: codePreviewDecimalPlaces))
)
"""
        
        return addAnimationOptions(to: animationString)
    }
    
    
    func createAnimation() -> Animation {
        return .interactiveSpring(
            response: response,
            dampingFraction: dampingFraction,
            blendDuration: blendDuration
        )
        .speed(getSpeed())
        .delay(getDelay())
    }
}

extension InteractiveSpring {
    
    // Parameters
    static let responseParameter = AnimationParameter(
        name: "Response",
        description: """
Response controls how quickly an animating property value will try and get to a target. You can use the response to create an infinitely-stiff spring by setting its value to 0.

A sensible range is from 0.15 - 0.55.
""",
        defaultValue: 0.15,
        range: 0.01 ... 1
    )
    
    static let dampingFractionParameter = AnimationParameter(
        name: "Damping fraction",
        description: """
It is defined as the ratio at which an oscillating view stops over time. You can use it to causes a gradual reduction in the spring's oscillation.

Experiment with the range of 0.25 - 0.55 to build animations with higher bounciness.
""",
        defaultValue: 0.86,
        range: 0.01 ... 1
    )
    
    static let blendDurationParameter = AnimationParameter(
        name: "Blend duration",
        description: """
Blend duration defines how previous animation transitions to the next. It works with stacked or chained animations only, helping to create a smooth transition from the previous animation to the next. It cannot be observed when you have only one spring animation on the view.

""",
        defaultValue: 0.25,
        range: 0.01 ... 1
    )
}
