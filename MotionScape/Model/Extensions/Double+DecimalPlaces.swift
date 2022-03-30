//
//  Double+DecimalPlaces.swift
//  MotionScape
//
//  Created by Stefan Blos on 14.03.22.
//

import Foundation

extension Double {
    func stringWith(places decimals: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = decimals
        formatter.decimalSeparator = "."
        return formatter.string(from: self as NSNumber) ?? String(format: "%.\(decimals)f", self)
    }
}
