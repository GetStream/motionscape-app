//
//  AnimationControlOption.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 25.03.22.
//

import Foundation

enum AnimationControlOption: String, CaseIterable, Identifiable {
    case parameters, options
    var id: Self { self }
}
