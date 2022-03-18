//
//  Spring.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 16.03.22.
//

import Foundation

struct Spring: Equatable {
    var response: Double = 0.55
    var dampingFraction: Double = 0.825
    var blendDuration: Double = 0
}

extension Spring {
    
    // Parameter
    static let responseParameter = AnimationParameter(
        name: "Response",
        description: """
Response controls how quickly an animating property value will try and get to a target. You can use the response to create an infinitely-stiff spring by setting its value to 0.

A sensible range is from 0 - 1.
""",
        defaultValue: 0.55,
        range: 0.01 ... 1
    )
    
    static let dampingFractionParameter = AnimationParameter(
        name: "Damping fraction",
        description: """
The amount of drag applied to the value being animated, as a fraction of an estimate of the amount needed to produce critical damping. It is defined as the ratio at which an oscillating view stops over time. You can use it to causes a gradual reduction in the spring's oscillation.

A sensible range is from 0 - 1.
""",
        defaultValue: 0.825,
        range: 0.01 ... 1
    )
    
    static let blendDurationParameter = AnimationParameter(
        name: "Blend duration",
        description: """
Blend duration defines how previous animation transitions to the next. It works with stacked or chained animations only, helping to create a smooth transition from the previous animation to the next. It cannot be observed when you have only one spring animation on the view.

""",
        defaultValue: 0,
        range: 0.01 ... 1
    )
}
