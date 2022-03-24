//
//  ClosedRange+toString.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 24.03.22.
//

import Foundation

extension ClosedRange {
    var toString: String {
        "\(lowerBound) ... \(upperBound)"
    }
}
