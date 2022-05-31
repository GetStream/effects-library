# Basic effect configuration options

This article gives an overview over the configuration options that are common for all affects in the package.


## Overview

We aim to build our effects in a way that it's easy and intuitive to use. However, this might not always be possible, so in this article we want to exaplain to you the basic effect configuration options (meaning: parameters of `Config` files) that you can use for each and every effect of our package.

If there's still things remaining unclear, feel free to contact us for clarification.

The configuration options that are shared for all effects are the following:

- `content`: `[Content]`
- `backgroundColor`: `Color`
- `intensity`: ``Intensity``
- `lifetime`: ``Lifetime``
- `initialVelocity`: ``InitialVelocity``
- `fadeOut`: ``FadeOut``
- `spreadRadius`: ``SpreadRadius``

## Explanations of options

Let's go over all the options we have and discuss what they do and mean.

### content

The `content` parameter is one of the most powerful options we have. It allows you to set the content of the single particles all of our effects are made of. It is actually an array of ``Content`` objects. The ``Content`` type is a custom `enum` which can take multiple values, specifically the following three:

- `.shape`
- `.image`
- `.emoji`

In our advanced tutorial we go over how to use each of those, so let's only quickly see some examples of how to define the content array (we've actually taken this example directly from the tutorial itself). 

```Swift
let content: [Content] = [
    .shape(.triangle, .blue, 10.0),
    .shape(.square, .green, 10.0),
    .shape(.circle, .red, 10.0),
    .emoji("🚀", 10.0),
    .emoji("💥", 3.0),
    .image(UIImage(named: "stream-logo")!, nil, 0.8)
]
```

It demonstrates how to exactly configure each of the parameter types. For the `.image` it requires us to have an image with the name `stream-logo` in the Assets folder.

Each content item always has a scaling parameter as the last option as well. This is used so that you can manually scale the size of each particle. This gives you the power to e.g. combine differently sized images with emojis and shapes and fine-tune them so that they are of equal size.

The `.shape` and `.image` parameters have an optional `UIColor` option as well. This allows you to directly tint the pieces in any way you like. You can also leave this as `nil` to have the effect take care of coloring the particles itself.

For each of the effects we have a sensible default `content` parameter which is different in every case. However, as this library is open-source you can always have a look at the source code. The `Config` files have default parameters and you can find the `content` definitions there.
 
### backgroundColor

As the name suggests this allows you to set a background color on your effects. By default this is set to `.clear` so that you can place the effects on top of other UI elements (`ZStack` is our friend here.). But you're free to set this to any value you like.

### intensity

The `intensity` parameter is one of the configuration options where you see the most impact. It will make the effect more lively when set to the `.high` option and way more subtle when set to `.low`. The default is always to have it at `.medium`.

The cool thing is that internally it has different manifestations of how values will change. Some effects use `SpriteKit` where it will have an effect on some of the values being set there. Other effects make use of `CAEmitterLayer` where the changes for the `intensity` will have very different changes of parameters.

That is the goal that we aimed for with this library. The level of abstraction that you can change parameters depending on understandable functionality and don't need to know how that works internally.

### lifetime

Each particle in a system has a certain duration where it will be existant - the `lifetime`. With this parameter you can specify how long that will be. As this determines how long they will be on screen it will also have an effect on how _dragged out_ the effect will be. Shorter lifetime will lead to shorter bursts of effects.

The possible values are:

- `.short`
- `.medium` (default)
- `.long`

### initialVelocity

For each of the effects the particles are emitted from a source. Depending on this `initialVelocity` particles will be emitted faster or slower. The higher the initial velocity is, the more widespread the effect will be. As some effects are directly affected by gravity that will also impact the trajectory they will take. E.g. for rain it will detemine whether the rain is more spread around the available space or more centered toward the middle.

You can select between `.short`, `.medium` (default), and `.fast`.

### fadeOut

The `fadeOut` is related to the `lifetime` value but contrary to that one it will not directly remove particles. It will slowly fade them out by reducing the opacity over time. Here you have 4 options:

* `.none` 
* `.slow` 
* `.medium` (default)
* `.fast`

We want to emphasize again: the goal was that you don't need to know anything about the underlying implementation but you can just play around with some sensible defaults that we have set.

### spreadRadius

The `spreadRadius` specifies the radius in which particles are emitted from the source. That can be in a full circle or only in a certain angle. This parameter is pretty specific to the effects but all of them have the options of `.low`, `.medium`, and `.high`.

## Summary

Hopefully, this gave you a nice introduction into the configuration options of all the effects. Some effects even have some more specialized paramters and we'll get to them in a follow article, that will be be coming soon. Stay tuned.
