//
//  RainConfig+DefaultValues.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SwiftUI

extension RainConfig {
    var birthRateValue: Float {
        switch intensity {
        case .low:
            return 50
        case .medium:
            return 200
        case .high:
            return 400
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
            return 50
        case .medium:
            return 250
        case .fast:
            return 400
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
            return 1
        case .medium:
            return 6.284
        case .high:
            return 15.0
        }
    }
}
