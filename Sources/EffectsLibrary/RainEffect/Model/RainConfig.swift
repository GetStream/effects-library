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
///     - content: This is an array of `Content` enum objects. You can see its documentation for how to use/implement those  (see ``Content`` for more information). It offers the following cases: `.image`, `.emoji`,  and `.shape`. Default value here is an image of a rain drop you can see in the `Resources` folder..
///     - `backgroundColor`: The background color (of type `Color`) of the view that contains the effect. Default is `.clear`.
///     - `intensity`: The intensity of the effect.  It will be translated into different values internally that will lead to varying intensities of the effect. The type is ``Intensity`` and it can take the different values `.low`, `medium` and `high`. For more information on what it does see the documentation for the ``Intensity`` type. Default in this case is `.medium`.
///     - `lifetime`: Defines how long the single elements of the effect will stay alive. The type is ``Lifetime`` (click to see more details) and it has the values `.short`, `.medium` and `.long`. Default is `.medium`.
///     - `initialVelocity`: Specifies the initial speed with which rain particles will be emitted from the source. The higher the value the larger the radius of the effects as elements will spread in a larger radius around the source. The type is ``InitialVelocity`` and possible values are `.slow`, `.medium`, and `.fast`. Default value is `.medium`.
///     - `fadeOut`: Specifies how fast elements of the effect will fade out (meaning: become transparent). Difference to `lifetime` is that there elements will be removed instantly whereas here there is a fading effect that is more subtle over time. The type is ``FadeOut`` (click to see more details) with the values `.none`, `.slow`, `.medium`, and `.fast`. Default is `.medium`.
///     - `spreadRadius`: Defines the angle in which the single elements of the effect are emitted. The type ``SpreadRadius`` (click to see more details) defines 3 values: `.low`, `.medium`, and `.high`. The default is `.high` (leading to a complete circle of particles emitted from the source).
///     - emitterPosition: Describes the position of the root of the effect. Implemented as an enum with the following options: `.top`, `.center`, and `.bottom`. Default value is `.top`.
///     - clipsToBounds: specifies whether the effect is constrained to the `RainView` itself or can leak around. Default is `false` (effect leaks outside).
///     - fallDirection: an enum value of type `FallDirection`. There are two options for now, being `.upwards` (particles are moving up the screen from the source they are emitted) and `.downwards` (particles are falling downwards from the origin of the source). Default is `.downwards`.
public struct RainConfig: EmitterLayerConfig {
    // base config parameters
    var content: [Content] = [
        .image(UIImage.loadFromBundle(named: .raindrop), nil, 0.004)
    ]
    var backgroundColor: Color = .clear
    var intensity: Intensity = .medium
    var lifetime: Lifetime = .medium
    var initialVelocity: InitialVelocity = .medium
    var fadeOut: FadeOut = .medium
    var spreadRadius: SpreadRadius = .high
    
    // emitter layer config parameters
    var emitterPosition: EmitterPosition = .top
    var clipsToBounds: Bool = false
    var fallDirection: FallDirection = .downwards
    
    /// We need to define custom public initializers as they're internal by default.
    public init() {}
    
    /// We need to define custom public initializers as they're internal by default.
    public init(
        content: [Content] = [
            .image(UIImage.loadFromBundle(named: .raindrop), nil, 0.004)
        ],
        backgroundColor: Color = .clear,
        intensity: Intensity = .medium,
        lifetime: Lifetime = .medium,
        initialVelocity: InitialVelocity = .medium,
        fadeOut: FadeOut = .medium,
        spreadRadius: SpreadRadius = .medium,
        
        // emitter layer config parameters
        emitterPosition: EmitterPosition = .top,
        clipsToBounds: Bool = false,
        fallDirection: FallDirection = .downwards
    ) {
        self.content = content
        self.backgroundColor = backgroundColor
        self.intensity = intensity
        self.lifetime = lifetime
        self.initialVelocity = initialVelocity
        self.fadeOut = fadeOut
        self.spreadRadius = spreadRadius
        
        self.emitterPosition = emitterPosition
        self.clipsToBounds = clipsToBounds
        self.fallDirection = fallDirection
    }
}
