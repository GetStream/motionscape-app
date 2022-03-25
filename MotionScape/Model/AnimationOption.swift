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
            return "\n\t.delay(\(value))"
        case .speed:
            return "\n\t.speed(\(value))"
        }
    }
    
    static func createDelay() -> AnimationOption {
        return AnimationOption(
            type: .delay,
            value: 1.0,
            description: "Delays the animation by the specified amount. Unit is seconds and the value needs to be a `Double`.",
            defaultValueDescription: "0.0",
            rangeDescription: "0 ... 10"
        )
    }
    
    static func createSpeed() -> AnimationOption {
        return AnimationOption(
            type: .speed,
            value: 0.25,
            description: "This is an option to speed up or slow down the animation. It is of type `Double`. You can make it a value below 1 to slow it down and increase it to a value larger than 1 to speed it up.",
            defaultValueDescription: "1",
            rangeDescription: "0 ... 10")
    }
}
