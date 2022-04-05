//
//  InitialVelocity.swift
//  
//
//  Created by Stefan Blos on 30.03.22.
//

import Foundation

/// InitialVelocity controls how fast the single elements for the effect will be emitted onto the screen.
///
/// You can think of the initialVelocity as the initial speed with which each of the particles that the effect has will be released.
///
/// The 3 possible values are:
/// - `.slow`: elements move in a slow way.
/// - `.medium`: elements will move with mediocre initialVelocity. Default.
/// - `.fast`: elements will move fast on screen.
public enum InitialVelocity {
    case slow, medium, fast
}
