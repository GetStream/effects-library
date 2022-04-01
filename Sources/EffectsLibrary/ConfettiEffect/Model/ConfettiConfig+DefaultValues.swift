//
//  ConfettiConfig+DefaultValues.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SwiftUI

extension ConfettiConfig {
    var birthRateValue: Float {
        switch intensity {
        case .low:
            return 5
        case .medium:
            return 15
        case .high:
            return 30
        }
    }
    
    var lifetimeValue: Float {
        switch lifetime {
        case .short:
            return 4
        case .medium:
            return 10
        case .long:
            return 20
        }
    }
    
    var velocityValue: CGFloat {
        switch speed {
        case .slow:
            return 10
        case .medium:
            return 100
        case .fast:
            return 200
        }
    }
    
    var alphaSpeedValue: Float {
        switch fadeOut {
        case .none:
            return 0
        case .slow:
            return 4
        case .medium:
            return 2
        case .fast:
            return 0.5
        }
    }
    
    var spreadRadiusValue: CGFloat {
        switch spreadRadius {
        case .low:
            return -.pi / 4
        case .medium:
            return .pi
        case .high:
            return .pi * 2
        }
    }
}
