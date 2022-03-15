//
//  InterpolatingSpring.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import Foundation

struct InterpolatingSpring: Equatable {
    var mass: Double = 1
    var stiffness: Double = 100
    var damping: Double = 5
    var initialVelocity: Double = 0.0
}
