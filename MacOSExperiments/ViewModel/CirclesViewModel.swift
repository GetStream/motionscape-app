//
//  CirclesViewModel.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 10.03.22.
//

import Foundation

class CirclesViewModel: ObservableObject {
    
    @Published var animation: AnimationType = .interpolatingSpring
    @Published var interpolatingSpring = InterpolatingSpring()
    @Published var interactiveSpring = InteractiveSpring()
    
    func createAnimationCode() -> String {
        switch animation {
        case .interpolatingSpring:
            return """
.interpolatingSpring(
    mass: \(interpolatingSpring.mass),
    stiffness: \(interpolatingSpring.stiffness),
    damping: \(interpolatingSpring.damping),
    initialVelocity: \(interpolatingSpring.initialVelocity)
)
"""
        case .interactiveSpring:
            return """
.interactiveSpring(
    response: \(interactiveSpring.response),
    dampingFraction: \(interactiveSpring.dampingFraction),
    blendDuration: \(interactiveSpring.blendDuration)
)
"""
        }
    }
}
