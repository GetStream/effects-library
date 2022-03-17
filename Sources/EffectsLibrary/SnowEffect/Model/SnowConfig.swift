//
//  SnowConfig.swift
//  
//
//  Created by Stefan Blos on 11.03.22.
//

import SwiftUI

struct SnowConfig: BaseConfig {
    var content: [Content]
    var emitterPosition: EmitterPosition
    var clipsToBounds: Bool
    var backgroundColor: Color = .clear
    var birthRate: Float = 25
    var lifetime: Float = 10
    var fallDirection: FallDirection = .upwards
    
    public init(
        content: [Content] = [
            .image(UIImage(named: "snow", in: Bundle.module, with: .none)!, .orange),
            .emoji("❄️"),
            .emoji("❆"),
            .emoji("❄"),
            .emoji("❅")
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
