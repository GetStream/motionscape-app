//
//  AnimationExample.swift
//  MacOSExperiments
//
//  Created by Stefan Blos on 18.03.22.
//

import Foundation

enum AnimationExample: String, CaseIterable, Identifiable {
    case circles, chains, emojis
    
    var id: Self { self }
}
