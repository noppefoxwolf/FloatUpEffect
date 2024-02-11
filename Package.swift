// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FloatUpEffect",
    platforms: [.iOS(.v17), .visionOS(.v1)],
    products: [
        .library(
            name: "FloatUpEffect",
            targets: ["FloatUpEffect"]),
    ],
    targets: [
        .target(
            name: "FloatUpEffect"
        ),
        .testTarget(
            name: "FloatUpEffectTests",
            dependencies: ["FloatUpEffect"]
        ),
    ]
)
