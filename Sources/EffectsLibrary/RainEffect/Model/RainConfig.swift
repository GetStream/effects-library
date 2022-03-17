//
//  RainConfig.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import SwiftUI

struct RainConfig: BaseConfig {
    var content: [Content]
    var emitterPosition: EmitterPosition
    var clipsToBounds: Bool
    var backgroundColor: Color = .clear
    var birthRate: Float = 200
    var lifetime: Float = 10
    var fallDirection: FallDirection = .upwards
    
    public init(
        content: [Content] = [
            .image(UIImage.loadFromBundle(named: "raindrop"), .blue)
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
