//
//  RainConfig.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import SwiftUI


/// The `RainConfig` struct allows you to tailor the `RainView` to your needs with a lot of configuration options.
///
/// You can use the default parameters to get a fine-tuned effect with reasonable settings. However you can also go full customization-mode and set each parameter how you like it and experiment with it.
///
/// - Parameters:
///     - content: This is an array of ``Content`` enum objects. You can see its documentation for how to use/implement those. It offers the following cases: `.image`, `.emoji`,  and `.shape`. Default value is an image of a raindrop, that you can find under `Resources/raindrop.png`.
///     - emitterPosition: The value of type ``EmitterPosition`` describes the position of the root of the effect. Implemented as an enum with the following options: `.top`, `.center`, and `.bottom`. Default value is `.top`.
///     - clipsToBounds: specifies whether the effect is constrained to the ``RainView`` itself or can leak around. Default is `false` (effect leaks outside).
///     - backgroundColor: the background color of the view that contains the effect. Default is `.clear`.
///     - birthRate: a `Float` that defines how much particles of the effect are emitted. The higher the value, the more intense the effect will be. The lower the value the fewer particles are emitted. Default value is `200`.
///     - lifetime:a ``Lifetime``  that specifies how long particles remain on screen after they are emitted. The lower the value the shorter time each particle is alive. Higher values keep content on the screen for longer. Does not have an effect on the speed or direction items behave on the screen. Default value is `.medium`.
///     - fallDirection: an enum value of type ``FallDirection``. There are two options for now, being `.upwards` (particles are moving up the screen from the source they are emitted) and `.downwards` (particles are falling downwards from the origin of the source). Default is `.downwards`.
public struct RainConfig: BaseConfig {
    // base parameters
    var content: [Content]
    var emitterPosition: EmitterPosition
    var clipsToBounds: Bool
    var backgroundColor: Color
    var intensity: Intensity
    var lifetime: Lifetime
    var speed: Speed
    var fadeOut: FadeOut
    
    // custom parameters
    var fallDirection: FallDirection
    
    public init(
        content: [Content] = [
            .image(UIImage.loadFromBundle(named: "raindrop"), .blue)
        ],
        emitterPosition: EmitterPosition = .top,
        clipsToBounds: Bool = false,
        backgroundColor: Color = .clear,
        intensity: Intensity = .medium,
        lifetime: Lifetime = .medium,
        speed: Speed = .medium,
        fadeOut: FadeOut = .none,
        fallDirection: FallDirection = .downwards
    ) {
        // base parameters
        self.content = content
        self.emitterPosition = emitterPosition
        self.clipsToBounds = clipsToBounds
        self.backgroundColor = backgroundColor
        self.intensity = intensity
        self.lifetime = lifetime
        self.speed = speed
        self.fadeOut = fadeOut
        
        // custom parameters
        self.fallDirection = fallDirection
    }

}
