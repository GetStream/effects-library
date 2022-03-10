//
//  ConfettiConfig.swift
//  
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

@available(iOS 14.0, *)
/// The `ConfettiConfig` struct allows you to tailor the `ConfettiView` to your needs with a lot of configuration options.
struct ConfettiConfig {
    var content: [Content] = [
        .emoji("🎉"),
        .emoji("🎊"),
        .emoji("🥳"),
        .emoji("🎁")
    ]
    var emitterPosition: EmitterPosition = .bottom
    var clipsToBounds = false
    var backgroundColor: Color = .clear
    var birthRate: Float = 25
    var lifetime: Float = 10
    var fallDirection: FallDirection = .upwards
}

enum EmitterPosition {
    case top, center, bottom
}

enum FallDirection {
    case upwards, downwards
}
