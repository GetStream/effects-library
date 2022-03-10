//
//  ConfettiConfig.swift
//  
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI


/// The `ConfettiConfig` struct allows you to tailor the `ConfettiView` to your needs with a lot of configuration options.
///
/// You can use the default parameters to get a fine-tuned effect with reasonable settings. However you can also go full customization-mode and set each parameter how you like it and experiment with it.
///
/// - Parameters:
///     - content: This is an array of `Content` enum objects. You can see its documentation for how to use/implement those. It offers the following cases: `.image`, `.emoji`,  and `.shape`.
///     - emitterPosition: Describes the position of the root of the effect. Implemented as an enum with the following options: `.top`, `.center`, and `.bottom`. Default value is `.top`.
///     - clipsToBounds: specifies whether the effect is constrained to the `ConfettiView` itself or can leak around. Default is `false` (effect leaks outside)
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
        emitterPosition: EmitterPosition = .top,
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
