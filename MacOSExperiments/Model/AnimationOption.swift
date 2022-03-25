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
    var active: Bool
    var value: Double
    
    var name: String {
        return type.rawValue.capitalized
    }
    
    func createCodeSnippet() -> String {
        switch type {
        case .delay:
            return "\n\t.delay(\(value))"
        }
    }
    
    static func createDelay() -> AnimationOption {
        return AnimationOption(type: .delay, active: false, value: 1.0)
    }
}
