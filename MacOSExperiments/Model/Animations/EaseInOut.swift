//
//  EaseInOut.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 16.03.22.
//

import Foundation

struct EaseInOut: Equatable {
    var duration: Double = 1
}

extension EaseInOut {
    
    // Parameter
    static let durationParameter = AnimationParameter(
        name: "Duration",
        description: "The duration of the animation.",
        range: 0 ... 10)
}
