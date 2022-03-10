//
//  ConfettiConfig.swift
//  
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

@available(iOS 14.0, *)
/// The `ConfettiConfig` struct allows you to tailor the `ConfettiView` to your needs with a lot of configuration options.
public struct ConfettiConfig {
    var content: [Content]
    var emitterPosition: EmitterPosition
    var clipsToBounds: Bool
    var backgroundColor: Color = .clear
    var birthRate: Float = 25
    var lifetime: Float = 10
    var fallDirection: FallDirection = .upwards
    
    public init(
        content: [Content] = [
            .emoji("🎉"),
            .emoji("🎊"),
            .emoji("🥳"),
            .emoji("🎁")
        ],
        emitterPosition: EmitterPosition = .bottom,
        clipsToBounds: Bool = false,
        backgroundColor: Color = .clear,
        birthRate: Float = 25,
        lifetime: Float = 10,
        fallDirection: FallDirection = .downwards
    ) {
        self.content = content
        self.emitterPosition = emitterPosition
        self.clipsToBounds = clipsToBounds
        self.backgroundColor = backgroundColor
        self.birthRate = birthRate
        self.lifetime = lifetime
        self.fallDirection = fallDirection
    }
}

public enum EmitterPosition {
    case top, center, bottom
}

public enum FallDirection {
    case upwards, downwards
}
