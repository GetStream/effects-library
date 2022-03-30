//
//  File.swift
//  
//
//  Created by Stefan Blos on 30.03.22.
//

import Foundation


/// The intensity value describes how much action there is going on when creating an effect. This includes the amount of particles that will be emitted.
///
/// The 3 possible values are:
/// - `.low`: defines a low intensity.
/// - `.medium`: the sweet spot in between `.low` and `.high` intensity. This is the default configuration.
/// - `.high`: defines a high intensity.
public enum Intensity {
    case low, medium, high
}
