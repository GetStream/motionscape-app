//
//  CirclesViewModel.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 10.03.22.
//

import Foundation
import AppKit

class CirclesViewModel: ObservableObject {
    
    
    
    @Published var interpolatingSpring = InterpolatingSpring()
    @Published var interactiveSpring = InteractiveSpring()
    @Published var spring = Spring()
    @Published var linear = Linear()
    @Published var easeIn = EaseIn()
    @Published var easeOut = EaseOut()
    @Published var easeInOut = EaseInOut()
    
    @Published var selectedAnimation: AnimationType? = AnimationType.interpolatingSpring
    
    func copyAnimationCodeToClipboard() {
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(createAnimationCode(), forType: .string)
    }
    
    private func createAnimationCode() -> String {
        print(selectedAnimation ?? "None selected")
        switch selectedAnimation {
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
        case .spring:
            return """
.spring(
    response: \(interactiveSpring.response),
    dampingFraction: \(interactiveSpring.dampingFraction),
    blendDuration: \(interactiveSpring.blendDuration)
)
"""
        case .linear:
            return """
.linear(
    duration: \(linear.duration)
)
"""
        case .easeIn:
            return """
.easeIn(
    duration: \(easeIn.duration)
)
"""
        case .easeOut:
            return """
.easeOut(
    duration: \(easeOut.duration)
)
"""
        case .easeInOut:
            return """
.easeInOut(
    duration: \(easeInOut.duration)
)
"""
        case .none:
            return "No animation selected."
        }
    }
}
