//
//  FireworksConfig+DefaultValues.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SwiftUI

extension FireworksConfig {
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
            return 0.2
        case .medium:
            return 0.5
        case .long:
            return 1.5
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
