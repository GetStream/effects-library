// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "EffectsLibrary",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "EffectsLibrary",
            targets: ["EffectsLibrary"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "EffectsLibrary",
            dependencies: [],
            resources: [.process("Resources")])
    ]
)
