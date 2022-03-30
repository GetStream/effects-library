//
//  BaseConfig.swift
//  
//
//  Created by Stefan Blos on 11.03.22.
//

import SwiftUI

protocol BaseConfig {
    var content: [Content] { get }
    var emitterPosition: EmitterPosition { get }
    var clipsToBounds: Bool { get }
    var backgroundColor: Color { get }
    var intensity: Intensity { get }
    var lifetime: Lifetime { get }
    var speed: Speed { get }
}
