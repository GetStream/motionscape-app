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
    
    func getDelay() -> Double
}

extension MyAnimation {
    
    func getDelay() -> Double {
        return animationOptions
            .filter { $0.type == .delay && $0.active }
            .map { $0.value }
            .first ?? 0.0
    }
    
}
