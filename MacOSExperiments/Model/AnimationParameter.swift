//
//  AnimationParameter.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 16.03.22.
//

import Foundation

struct AnimationParameter: Equatable, Documentable {
    var name: String
    var description: String
    var defaultValue: Double?
    var range: ClosedRange<Double>
    
    var defaultValueDescription: String {
        defaultValue != nil ? "\(defaultValue!)" : "Not available"
    }
    
    var rangeDescription: String {
        range.toString
    }
}
