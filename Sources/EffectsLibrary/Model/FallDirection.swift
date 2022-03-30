//
//  File.swift
//  
//
//  Created by Stefan Blos on 11.03.22.
//

import Foundation

/// The `FallDirection` enum gives you the option to specify if an effects particles should either fall up or down.
///
/// There are 2 possible values here:
///   - `.upwards`:  Particles will fall from the bottom to the top.
///   - `.downwards`: Particles will fall from the top to the bottom (default).
public enum FallDirection {
    case upwards, downwards
}
