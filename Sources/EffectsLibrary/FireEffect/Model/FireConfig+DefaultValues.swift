//
//  FireConfig+DefaultValues.swift
//  
//
//  Created by Stefan Blos on 29.04.22.
//

import SwiftUI

extension FireConfig {
    var birthRateValue: Float {
        switch intensity {
        case .low:
            return 50
        case .medium:
            return 450
        case .high:
            return 1000
        }
    }
    
    var lifetimeValue: Float {
        switch lifetime {
        case .short:
            return 1
        case .medium:
            return 2.5
        case .long:
            return 5
        }
    }
    
    var velocityValue: CGFloat {
        switch initialVelocity {
        case .slow:
            return 20
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
            return -0.1
        case .medium:
            return -0.45
        case .fast:
            return -0.7
        }
    }
    
    var spreadRadiusValue: CGFloat {
        switch spreadRadius {
        case .low:
            return .pi / 9
        case .medium:
            return .pi / 6
        case .high:
            return .pi / 3
        }
    }
    
}
