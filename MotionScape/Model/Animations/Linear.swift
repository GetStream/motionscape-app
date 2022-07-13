//
//  Linear.swift
//  MotionScape
//
//  Created by Stefan Blos on 16.03.22.
//

import SwiftUI

struct Linear: Equatable {
    var duration: Double = 1
    
    var name = NSLocalizedString("Linear",comment: "")
    
    var animationOptions: [AnimationOption] = [
        .createDelay(),
        .createSpeed()
    ]
}

extension Linear: MyAnimation {
    
    func createCodeSnippet() -> String {
        let animationString = """
.linear(
    duration: \(duration.stringWith(places: codePreviewDecimalPlaces))
)
"""
        
        return addAnimationOptions(to: animationString)
    }
 
    func createAnimation() -> Animation {
        return .linear(
            duration: duration
        )
        .speed(getSpeed())
        .delay(getDelay())
    }
    
}

extension Linear {
    
    // Parameter
    static let durationParameter = AnimationParameter(
        name: NSLocalizedString("Duration",comment: ""),
        description: NSLocalizedString("The duration of the animation.",comment: ""),
        range: 0 ... 10)
}
