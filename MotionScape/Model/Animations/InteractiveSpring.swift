//
//  InteractiveSpring.swift
//  MotionScape
//
//  Created by Stefan Blos on 14.03.22.
//

import SwiftUI

struct InteractiveSpring: Equatable {
    
    var name = NSLocalizedString("Interactive Spring",comment: "")
    
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
        name: NSLocalizedString("Response",comment: ""),
        description: NSLocalizedString("Response Content 1",comment: ""),
        defaultValue: 0.15,
        range: 0.01 ... 1
    )
    
    static let dampingFractionParameter = AnimationParameter(
        name: NSLocalizedString("Damping fraction",comment: ""),
        description: NSLocalizedString("Damping fraction Content 1",comment: ""),
        defaultValue: 0.86,
        range: 0.01 ... 1
    )
    
    static let blendDurationParameter = AnimationParameter(
        name: NSLocalizedString("Blend duration",comment: ""),
        description: NSLocalizedString("Blend duration Content",comment: ""),
        defaultValue: 0.25,
        range: 0.01 ... 1
    )
}
