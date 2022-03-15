//
//  Double+DecimalPlaces.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 14.03.22.
//

import Foundation

extension Double {
    func stringWith(places decimals: Int) -> String {
        String(format: "%.\(decimals)f", self)
    }
}
