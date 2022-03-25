//
//  Documentable.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 25.03.22.
//

import Foundation

protocol Documentable {
    var description: String { get }
    var defaultValueDescription: String { get }
    var rangeDescription: String { get }
}
