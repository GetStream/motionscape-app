//
//  MyAnimation.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 25.03.22.
//

import SwiftUI

protocol MyAnimation {
    var name: String { get }
    var animationOptions: [AnimationOption] { get }
    
    func createAnimation() -> Animation
    func createCodeSnippet() -> String
    func addAnimationOptions(to animationString: String) -> String
    
    func getDelay() -> Double
    func getSpeed() -> Double
}

extension MyAnimation {
    
    func addAnimationOptions(to animationString: String) -> String {
        var copiedAnimationString = animationString
        
        // get all active animation options for that Animation
        let activeAnimationOptions = animationOptions
            .filter { $0.active }
        
        // add each animation option to the copied String
        for animation in activeAnimationOptions {
            copiedAnimationString += animation.createCodeSnippet()
        }
        
        return copiedAnimationString
    }
    
    func getDelay() -> Double {
        return animationOptions
            .filter { $0.type == .delay && $0.active }
            .map { $0.value }
            .first ?? 0.0
    }
    
    func getSpeed() -> Double {
        return animationOptions
            .filter { $0.type == .speed && $0.active }
            .map { $0.value }
            .first ?? 1
    }
    
}
