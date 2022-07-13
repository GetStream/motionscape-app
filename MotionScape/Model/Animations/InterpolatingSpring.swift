//
//  InterpolatingSpring.swift
//  MotionScape
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct InterpolatingSpring {
    
    var name: String = NSLocalizedString("Interpolating Spring",comment: "")
    var mass: Double = 1
    var stiffness: Double = 170
    var damping: Double = 15
    var initialVelocity: Double = 0.0
    
    var animationOptions: [AnimationOption] = [
        .createDelay()
    ]
}

extension InterpolatingSpring: MyAnimation {
    
    func createCodeSnippet() -> String {
        let animationString = """
.interpolatingSpring(
    mass: \(mass.stringWith(places: codePreviewDecimalPlaces)),
    stiffness: \(stiffness.stringWith(places: codePreviewDecimalPlaces)),
    damping: \(damping.stringWith(places: codePreviewDecimalPlaces)),
    initialVelocity: \(initialVelocity.stringWith(places: codePreviewDecimalPlaces))
)
"""
        
        return addAnimationOptions(to: animationString)
    }
 
    func createAnimation() -> Animation {
        return .interpolatingSpring(
            mass: mass,
            stiffness: stiffness,
            damping: damping,
            initialVelocity: initialVelocity
        )
        .speed(getSpeed())
        .delay(getDelay())
    }
}

extension InterpolatingSpring {
    
    // Parameters
    static let stiffnessParamter = AnimationParameter(
        name: NSLocalizedString("Stiffness",comment: ""),
        description: NSLocalizedString("Stiffness Content",comment: ""),
        range: 1 ... 400)
    
    static let dampingParameter = AnimationParameter(
        name: NSLocalizedString("Damping",comment: ""),
        description: NSLocalizedString("Damping Content",comment: ""),
        range: 1 ... 400
    )
    
    static let massParameter = AnimationParameter(
        name: NSLocalizedString("Mass",comment: ""),
        description: NSLocalizedString("Mass Content",comment: ""),
        defaultValue: 1,
        range: 1 ... 10
    )
    
    static let initialVelocityParameter = AnimationParameter(
        name: NSLocalizedString("Initial Velocity",comment: ""),
        description: NSLocalizedString("Initial Velocity Content",comment: ""),
        defaultValue: 0,
        range: 0 ... 10
    )
}
