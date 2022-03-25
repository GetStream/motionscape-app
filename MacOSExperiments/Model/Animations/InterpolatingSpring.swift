//
//  InterpolatingSpring.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct InterpolatingSpring {
    
    var name: String = "Interpolating Spring"
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
        var baseString = """
.interpolatingSpring(
    mass: \(mass),
    stiffness: \(stiffness),
    damping: \(damping),
    initialVelocity: \(initialVelocity)
)
"""
        let activeAnimationOptions = animationOptions
            .filter { $0.active }
        for animation in activeAnimationOptions {
            baseString += animation.createCodeSnippet()
        }
        
        return baseString
    }
 
    func createAnimation() -> Animation {
        return .interpolatingSpring(
            mass: mass,
            stiffness: stiffness,
            damping: damping,
            initialVelocity: initialVelocity
        )
        .delay(getDelay())
    }
}

extension InterpolatingSpring {
    
    // Parameters
    static let stiffnessParamter = AnimationParameter(
        name: "Stiffness",
        description: """
Stiffness is the tensile strength of the spring. It changes how quickly the object moves towards its target. A higher stiffness will make the animation snappier.

Use a range of 5 - 400 depending on the mass and damping value. For example, using the stiffness of 170 and the damping of 15 creates a gentle bounce.
""",
        range: 1 ... 400)
    
    static let dampingParameter = AnimationParameter(
        name: "Damping",
        description: """
It is defined as the back-drag frictional force of the surface the animating object is resting on. The operating principle of damping is much like the braking system of a car. Its purpose is to stop the animating view over time.  It also affects the ability to overshoot the object.  Use damping of 0 to make the animating view oscillate forever.

Start with 100, which means no overshoot. Using, for example, damping of 5 will create more overshoot.
""",
        range: 1 ... 400
    )
    
    static let massParameter = AnimationParameter(
        name: "Mass",
        description: """
This is the weight of the object attached to the spring. It changes the willingness of the object to move or stop moving. A larger mass makes the animating view difficult to move, speed up, slow down.

A sensible range goes from 1 to 10.
""",
        defaultValue: 1,
        range: 1 ... 10
    )
    
    static let initialVelocityParameter = AnimationParameter(
        name: "Initial Velocity",
        description: """
It is defined as the speed at which the animation object changes at the beginning of the animation. Using a higher value will speed up the animation quickly in the begin-time.

A sensible range goes from 1 to 4.
""",
        defaultValue: 0,
        range: 0 ... 10
    )
}
