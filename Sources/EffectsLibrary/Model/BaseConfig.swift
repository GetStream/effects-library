//
//  BaseConfig.swift
//  
//
//  Created by Stefan Blos on 11.03.22.
//

import SwiftUI

protocol BaseConfig {
    var content: [Content] { get }
    var backgroundColor: Color { get }
    var intensity: Intensity { get }
    var lifetime: Lifetime { get }
    var speed: Speed { get }
    var fadeOut: FadeOut { get }
    var spreadRadius: SpreadRadius { get }
    
    // default values for base configs view values
    var birthRateValue: Float { get }
    var lifetimeValue: Float { get }
    var velocityValue: CGFloat { get }
    var alphaSpeedValue: Float { get }
    var spreadRadiusValue: CGFloat { get }
}
