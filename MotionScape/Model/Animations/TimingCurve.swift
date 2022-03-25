//
//  TimingCurve.swift
//  MotionScape
//
//  Created by Stefan Blos on 21.03.22.
//

import SwiftUI

struct TimingCurve {
    var x0: Double = 0.13
    var y0: Double = 0.65
    var x1: Double = 0.81
    var y1: Double = 0.18
    
    var name = "Timing Curve"
    
    var animationOptions: [AnimationOption] = [
        .createDelay(),
        .createSpeed()
    ]
}

extension TimingCurve: MyAnimation {
    
    func createCodeSnippet() -> String {
        let animationString = """
.timingCurve(
    \(x0),
    \(y0),
    \(x1),
    \(y1)
)
"""
        
        return addAnimationOptions(to: animationString)
    }
 
    func createAnimation() -> Animation {
        return .timingCurve(
            x0,
            y0,
            x1,
            y1
        )
        .speed(getSpeed())
        .delay(getDelay())
    }
    
}

extension TimingCurve {
    
    // Parameters
    static let firstControlPointX = AnimationParameter(name: "x0", description: "The x value of the first control point for the timing curve.", defaultValue: 0.13, range: 0 ... 1)
    
    static let firstControlPointY = AnimationParameter(name: "y0", description: "The y value of the first control point for the timing curve.", defaultValue: 0.65, range: 0 ... 1)
    
    static let secondControlPointX = AnimationParameter(name: "x1", description: "The x value of the second control point for the timing curve.", defaultValue: 0.81, range: 0 ... 1)
    
    static let secondControlPointY = AnimationParameter(name: "y1", description: "The y value of the second control point for the timing curve.", defaultValue: 0.18, range: 0 ... 1)
}
