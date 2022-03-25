//
//  AnimationOption.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 24.03.22.
//

import SwiftUI

struct AnimationOption: Identifiable, Equatable {
    var id = UUID()
    var type: AnimationOptionType
    var active: Bool = false
    var value: Double
    
    var name: String {
        return type.rawValue.capitalized
    }
    
    func createCodeSnippet() -> String {
        switch type {
        case .delay:
            return "\n\t.delay(\(value))"
        case .speed:
            return "\n\t.speed(\(value))"
        }
    }
    
    static func createDelay() -> AnimationOption {
        return AnimationOption(type: .delay, value: 1.0)
    }
    
    static func createSpeed() -> AnimationOption {
        return AnimationOption(type: .speed, value: 0.25)
    }
}
