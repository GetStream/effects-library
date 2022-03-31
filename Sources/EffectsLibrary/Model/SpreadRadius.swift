//
//  SpreadRadius.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import Foundation

/// The `SpreadRadius` describes the cone where new effect elements/particles will spawn.
///
/// The 3 possible values are:
/// - `.low`: The radius will be small, so items will spawn from roughly the same spot.
/// - `.medium`: The radius will be medium so there will be a larger are where elements/particles spawn. Default.
/// - `.high`: The radius will be large so elements/particles will spawn from a large possible area.
public enum SpreadRadius {
    case low, medium, high
}
