//
//  FireworksConfig.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SwiftUI

struct FireworksConfig: BaseConfig {
    var content: [Content] = [
        .image(UIImage.loadFromBundle(named: .spark), nil, 1)
    ]
    var emitterPosition: EmitterPosition = .top
    var clipsToBounds: Bool = true
    var backgroundColor: Color = .clear
    var intensity: Intensity = .medium
    var lifetime: Lifetime = .medium
    var speed: Speed = .medium
    var fadeOut: FadeOut = .medium
    var spreadRadius: SpreadRadius = .high
}

