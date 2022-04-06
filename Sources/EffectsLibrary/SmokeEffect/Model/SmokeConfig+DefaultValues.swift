//
//  SmokeConfig+DefaultValues.swift
//  
//
//  Created by Stefan Blos on 05.04.22.
//

import SwiftUI

extension SmokeConfig {
    var birthRateValue: Float {
        switch intensity {
        case .low:
            return 1.5
        case .medium:
            return 0.5
        case .high:
            return 0.1
        }
    }
    
    var lifetimeValue: Float {
        switch lifetime {
        case .short:
            return 2
        case .medium:
            return 10
        case .long:
            return 100
        }
    }
    
    var velocityValue: CGFloat {
        switch initialVelocity {
        case .slow:
            return 10
        case .medium:
            return 200
        case .fast:
            return 400
        }
    }
    
    var alphaSpeedValue: Float {
        switch fadeOut {
        case .none:
            return 0
        case .slow:
            return 0.2
        case .medium:
            return -1.4
        case .fast:
            return -3
        }
    }
    
    var spreadRadiusValue: CGFloat {
        switch spreadRadius {
        case .low:
            return .pi / 4
        case .medium:
            return .pi
        case .high:
            return .pi * 2
        }
    }

}
