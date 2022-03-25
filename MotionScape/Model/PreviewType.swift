//
//  PreviewType.swift
//  MotionScape
//
//  Created by Stefan Blos on 24.03.22.
//

import Foundation

enum PreviewType: String, CaseIterable, Identifiable {
    case animation, code
    var id: Self { self }
}
