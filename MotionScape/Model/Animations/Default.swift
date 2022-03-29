//
//  Default.swift
//  MotionScape
//
//  Created by Stefan Blos on 29.03.22.
//

import SwiftUI

struct Default: Equatable {
    var name = "Default"
    
    var animationOptions: [AnimationOption] = [
        .createDelay(),
        .createSpeed()
    ]
}

extension Default: MyAnimation {
    
    func createAnimation() -> Animation {
        return .default
            .speed(getSpeed())
            .delay(getDelay())
    }
    
    func createCodeSnippet() -> String {
        let animationString = """
.default
"""
        
        return addAnimationOptions(to: animationString)
    }
    
    
}
