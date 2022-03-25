//
//  CirclesViewModel.swift
//  MotionScape
//
//  Created by Stefan Blos on 10.03.22.
//

import Foundation
import AppKit

class AnimationsViewModel: ObservableObject {
    
    @Published var animations = AllAnimations() {
        didSet {
            id = UUID()
        }
    }
    
    @Published var id = UUID()
    
    @Published var selectedAnimation: AnimationType? = AnimationType.interpolatingSpring
    
    func copyAnimationCodeToClipboard() {
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(createAnimationCode(), forType: .string)
    }
    
    private func createAnimationCode() -> String {
        switch selectedAnimation {
        case .interpolatingSpring:
            return """
.interpolatingSpring(
    mass: \(animations.interpolatingSpring.mass),
    stiffness: \(animations.interpolatingSpring.stiffness),
    damping: \(animations.interpolatingSpring.damping),
    initialVelocity: \(animations.interpolatingSpring.initialVelocity)
)
"""
        case .interactiveSpring:
            return """
.interactiveSpring(
    response: \(animations.interactiveSpring.response),
    dampingFraction: \(animations.interactiveSpring.dampingFraction),
    blendDuration: \(animations.interactiveSpring.blendDuration)
)
"""
        case .spring:
            return """
.spring(
    response: \(animations.interactiveSpring.response),
    dampingFraction: \(animations.interactiveSpring.dampingFraction),
    blendDuration: \(animations.interactiveSpring.blendDuration)
)
"""
        case .linear:
            return """
.linear(
    duration: \(animations.linear.duration)
)
"""
        case .easeIn:
            return """
.easeIn(
    duration: \(animations.easeIn.duration)
)
"""
        case .easeOut:
            return """
.easeOut(
    duration: \(animations.easeOut.duration)
)
"""
        case .easeInOut:
            return """
.easeInOut(
    duration: \(animations.easeInOut.duration)
)
"""
        case .none:
            return "No animation selected."
        }
    }
}
