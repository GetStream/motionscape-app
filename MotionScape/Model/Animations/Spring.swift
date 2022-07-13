//
//  Spring.swift
//  MotionScape
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct Spring: Equatable {
    var response: Double = 0.55
    var dampingFraction: Double = 0.825
    var blendDuration: Double = 0
    
    var name = NSLocalizedString("Spring",comment: "")
    
    var animationOptions: [AnimationOption] = [
        .createDelay()
    ]
}

extension Spring: MyAnimation {
    
    func createCodeSnippet() -> String {
        let animationString = """
.spring(
    response: \(response.stringWith(places: codePreviewDecimalPlaces)),
    dampingFraction: \(dampingFraction.stringWith(places: codePreviewDecimalPlaces)),
    blendDuration: \(blendDuration.stringWith(places: codePreviewDecimalPlaces))
)
"""
        
        return addAnimationOptions(to: animationString)
    }
    
    
    func createAnimation() -> Animation {
        return .spring(
            response: response,
            dampingFraction: dampingFraction,
            blendDuration: blendDuration
        )
        .speed(getSpeed())
        .delay(getDelay())
    }
}

extension Spring {
    
    // Parameter
    static let responseParameter = AnimationParameter(
        name: NSLocalizedString("Response",comment: ""),
        description: NSLocalizedString("Response Content 2",comment: ""),
        defaultValue: 0.55,
        range: 0.01 ... 1
    )
    
    static let dampingFractionParameter = AnimationParameter(
        name: NSLocalizedString("Damping fraction",comment: ""),
        description: NSLocalizedString("Damping fraction Content 2",comment: ""),
        defaultValue: 0.825,
        range: 0.01 ... 1
    )
    
    static let blendDurationParameter = AnimationParameter(
        name: NSLocalizedString("Blend duration",comment: ""),
        description: NSLocalizedString("Blend duration Content",comment: ""),
        defaultValue: 0,
        range: 0.01 ... 1
    )
}
