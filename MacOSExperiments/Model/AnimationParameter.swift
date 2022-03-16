//
//  AnimationParameter.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 16.03.22.
//

import Foundation

struct AnimationParameter: Equatable {
    var name: String
    var description: String
    var value: Double
    var range: Range<Double>
}
