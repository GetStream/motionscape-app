//
//  TimingCurve.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 21.03.22.
//

import Foundation

struct TimingCurve {
    var x0: Double = 0.13
    var y0: Double = 0.65
    var x1: Double = 0.81
    var y1: Double = 0.18
}

extension TimingCurve {
    
    // Parameters
    static let firstControlPointX = AnimationParameter(name: "x0", description: "The x value of the first control point for the timing curve.", defaultValue: 0.13, range: 0 ... 1)
    
    static let firstControlPointY = AnimationParameter(name: "y0", description: "The y value of the first control point for the timing curve.", defaultValue: 0.65, range: 0 ... 1)
    
    static let secondControlPointX = AnimationParameter(name: "x1", description: "The x value of the second control point for the timing curve.", defaultValue: 0.81, range: 0 ... 1)
    
    static let secondControlPointY = AnimationParameter(name: "y1", description: "The y value of the second control point for the timing curve.", defaultValue: 0.18, range: 0 ... 1)
}
