//
//  AnimationOption.swift
//  MotionScape
//
//  Created by Stefan Blos on 24.03.22.
//

import SwiftUI

struct AnimationOption: Identifiable, Equatable, Documentable {
    
    var id = UUID()
    var type: AnimationOptionType
    var active: Bool = false
    var value: Double
    var description: String
    var defaultValueDescription: String
    var rangeDescription: String
    
    
    var name: String {
        return type.rawValue.capitalized
    }
    
    func createCodeSnippet() -> String {
        switch type {
        case .delay:
            return "\n\t.delay(\(value.stringWith(places: codePreviewDecimalPlaces)))"
        case .speed:
            return "\n\t.speed(\(value.stringWith(places: codePreviewDecimalPlaces)))"
        }
    }
    
    static func createDelay() -> AnimationOption {
        return AnimationOption(
            type: .delay,
            value: 1.0,
            description: NSLocalizedString("Delays Description",comment: ""),
            defaultValueDescription: "0.0",
            rangeDescription: "0 ... 10"
        )
    }
    
    static func createSpeed() -> AnimationOption {
        return AnimationOption(
            type: .speed,
            value: 0.25,
            description: NSLocalizedString("Speed Description",comment: ""),
            defaultValueDescription: "1",
            rangeDescription: "0 ... 10")
    }
}
