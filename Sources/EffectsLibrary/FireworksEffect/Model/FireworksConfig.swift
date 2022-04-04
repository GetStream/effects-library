//
//  FireworksConfig.swift
//  
//
//  Created by Stefan Blos on 31.03.22.
//

import SwiftUI

/// The `FireworksConfig` struct allows you to tailor the `FireworksView` to your needs with a lot of configuration options.
///
/// You can use the default parameters to get a fine-tuned effect with reasonable settings. However you can also go full customization-mode and set each parameter how you like it and experiment with it.
///
/// - Parameters:
///     - content: This is an array of `Content` enum objects. You can see its documentation for how to use/implement those  (see ``Content`` for more information). It offers the following cases: `.image`, `.emoji`,  and `.shape`. Default value here is a specific image that is selected because it looks like the spark of a firework explosion (you can have a look at the file `spark.png` in the `Resources` folder.
///     - emitterPosition: Describes the position of the root of the effect. Implemented as an enum with the following options: `.top`, `.center`, and `.bottom`. Default value is `.top`.
///     - clipsToBounds: specifies whether the effect is constrained to the `ConfettiView` itself or can leak around. Default is `false` (effect leaks outside).
///     - backgroundColor: the background color of the view that contains the effect. Default is `.clear`.
///     - birthRate: a `Float` that defines how much particles of the effect are emitted. The higher the value, the more intense the effect will be. The lower the value the fewer particles are emitted. Default value is `25`.
///     - lifetime:a `Float`  that specifies how long particles remain on screen after they are emitted. The lower the value the shorter time each particle is alive. Higher values keep content on the screen for longer. Does not have an effect on the speed or direction items behave on the screen. Default value is `10`.
///     - fallDirection: an enum value of type `FallDirection`. There are two options for now, being `.upwards` (particles are moving up the screen from the source they are emitted) and `.downwards` (particles are falling downwards from the origin of the source). Default is `.downwards`.

public struct FireworksConfig: BaseConfig {
    var content: [Content] = [
        .image(UIImage.loadFromBundle(named: .spark), nil, 1)
    ]
    var backgroundColor: Color = .clear
    var intensity: Intensity = .medium
    var lifetime: Lifetime = .medium
    var speed: Speed = .medium
    var fadeOut: FadeOut = .medium
    var spreadRadius: SpreadRadius = .high
}

