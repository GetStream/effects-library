# EffectsLibrary

The Effects Library allows developers to create sophisticated and realistic particle systems such as snow, fire, rain, confetti, fireworks, and smoke with no or minimal effort.

![All effects previews ](https://github.com/GetStream/effects-library/blob/main/Sources/EffectsLibrary/Documentation.docc/Resources/getting-started/allEffects.gif)

It has premade effects ready to be used for your compositions. You can also build your own effects using nearly any image, shape, text view, and flexible customization options.

It is completely open-source with well-designed documentation and an interactive walkthrough tutorial to assist you to get started.

You can check the project’s sample app, contribute to its companion GitHub repository or let us know your feedback.

## 🚀 Getting started

### Installation

The package is distributed via Swift Package Manager. We have a [very thorough tutorial with clear instructions for the installation](https://getstream.github.io/effects-library/tutorials/effectslibrary/getting-started). You can also follow these steps:

1. In Xcode go to _File -> Add Packages_
2. In the top right of the opening window (where it says _Search or Enter Package URL_) paste the link to the repository: `https://github.com/GetStream/effects-library`
3. For the _Dependency Rule_ select _Up to Next Major Version_ and enter _1.0.0_ in the following field
4. Hit _Add Package_
5. Confirm _Add Package_ in the upcoming window as well

### Set up your first effect

When the setup is done it is very straightforward to add your first effect. They are all SwiftUI `View`s so you can just drop them into your layouts and get going. Here are all the `View`s:

- `FireworksView`
- `ConfettiView`
- `SnowView`
- `RainView`
- `SmokeView`
- `FireView`

An example for a `View` that uses one of the effects:

```Swift
import SwiftUI
import EffectsLibrary

struct ContentView: View {
    var body: some View {
        FireworksView()
    }
}
```

### Customize an effect with its config

Effects can be customized further with their config files. Here's an example of that:

```Swift
struct ContentView: View {
    var body: some View {
        FireworksView(
            config: FireworksConfig(
                content: [
                    .shape(.triangle, .blue, 10.0),
                    .shape(.square, .green, 10.0),
                    .shape(.circle, .red, 10.0),
                    .emoji("🚀", 10.0),
                    .emoji("💥", 3.0),
                    .image(UIImage(named: "stream-logo")!, nil, 0.8)
                ],
                intensity: .high,
                lifetime: .long,
                initialVelocity: .fast,
                fadeOut: .slow
            )
        )
    }
}
```

There are way more examples that can be found in the tutorials we provide for you:

- [Getting Started](https://getstream.github.io/effects-library/tutorials/effectslibrary/getting-started)
- [Advanced Tutorial](https://getstream.github.io/effects-library/tutorials/effectslibrary/advanced-tutorial)

## 🧵 Useful resources

We have created a [beautiful site with documentation](https://getstream.github.io/effects-library/documentation/effectslibrary/) to help you get started with the library. There are some basic articles out there (with more and more being added over time).

There is also a [number of tutorials](https://getstream.github.io/effects-library/tutorials/tutorial-table) we have created to make getting started with the library as seamless as possible. There is an [entry-level tutorial](https://getstream.github.io/effects-library/tutorials/effectslibrary/getting-started) where you will learn how to add the library to your app and take your first steps by adding the first effects.

There is also an [advanced tutorial](https://getstream.github.io/effects-library/tutorials/effectslibrary/advanced-tutorial) that showcases how to configure an effect to your needs. This will include fine-tuning with setting different configurations. Also, it will showcase completely changing up the effect and adding custom branding, all with very few lines of code.

The fun part is, that we've fully used [Apple's wonderful DocC](https://developer.apple.com/documentation/docc) documentation style throughout the package. That means that all functionality is heavily documented and is nicely integrated in Xcode.

You can even have a look at the way the tutorials and the entire documentation is created. Just have a look at the [Documentation folder](Sources/EffectsLibrary/Documentation.docc/).

Also, we have created a sample app so that you can see how to leverage the library in a real-world application. This is also fully open-source and it showcases all the effects that we have in the library.

Note: we're always happy to see contribution from the community, so feel free to play around, open issues and PRs and have fun with it.

## 🤩 About us

This package was created by [Stefan Blos](https://twitter.com/stefanjblos) and [Amos Gyamfi](https://twitter.com/amos_gyamfi) at [Stream](https://getstream.io). In case you want to contribute or just reach out to us you can do that on [Github](https://github.com/GetStream/effects-library) (with an issue, PR or similar) or Twitter.

We highly appreciate you considering our product. If you enjoy it, please consider giving the repo a ⭐️ as that will help us continue work on the project and realize all the wonderful things we have planned for the future.
