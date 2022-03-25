//
//  AnimationsViewModel.swift
//  MacOSExperiments
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
    
    @Published var selectedAnimation: AnimationType? = AnimationType.interpolatingSpring {
        didSet {
            id = UUID()
        }
    }
    
    
    func copyAnimationCodeToClipboard() {
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(createAnimationCode(), forType: .string)
    }
    
    func createAnimationCode() -> String {
        switch selectedAnimation {
        case .interpolatingSpring:
            return animations.interpolatingSpring.createCodeSnippet()
        case .interactiveSpring:
            return animations.interactiveSpring.createCodeSnippet()
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
        case .timingCurve:
            return """
.timingCurve(
    \(animations.timingCurve.x0),
    \(animations.timingCurve.y0),
    \(animations.timingCurve.x1),
    \(animations.timingCurve.y1)
)
"""
        case .none:
            return "No animation selected."
        }
    }
}
