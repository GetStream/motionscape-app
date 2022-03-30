//
//  AnimationsViewModel.swift
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
            return animations.spring.createCodeSnippet()
        case .linear:
            return animations.linear.createCodeSnippet()
        case .defaultAnimation:
            return animations.defaultAnimation.createCodeSnippet()
        case .easeIn:
            return animations.easeIn.createCodeSnippet()
        case .easeOut:
            return animations.easeOut.createCodeSnippet()
        case .easeInOut:
            return animations.easeInOut.createCodeSnippet()
        case .timingCurve:
            return animations.timingCurve.createCodeSnippet()
        case .none:
            return "No animation selected."
        }
    }
    
    func resetCurrentAnimation() {
        switch selectedAnimation {
        case .interpolatingSpring:
            animations.interpolatingSpring = InterpolatingSpring()
        case .interactiveSpring:
            animations.interactiveSpring = InteractiveSpring()
        case .spring:
            animations.spring = Spring()
        case .linear:
            animations.linear = Linear()
        case .defaultAnimation:
            animations.defaultAnimation = Default()
        case .easeIn:
            animations.easeIn = EaseIn()
        case .easeOut:
            animations.easeOut = EaseOut()
        case .easeInOut:
            animations.easeInOut = EaseInOut()
        case .timingCurve:
            animations.timingCurve = TimingCurve()
        case .none:
            print("Nothing to do here")
        }
    }
}
