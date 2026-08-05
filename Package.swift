// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusMetaAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusMetaAdapter",
            targets: ["TradPlusMetaAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.12.0")
        ),
        .package(
            url: "https://github.com/facebook/FBAudienceNetwork.git",
            .exact("6.21.1")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusMetaAdapter",
            dependencies: [
                .target(name: "TPFacebookAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "FBAudienceNetwork", package: "FBAudienceNetwork"),
            ],
            path: ".",
            sources: ["Sources/TradPlusMetaAdapter/TradPlusMetaAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPFacebookAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Meta/releases/download/15.12.0/TPFacebookAdapter-15.12.0.xcframework.zip",
            checksum: "05d1236775b0adc0dfbb72fe1dd03716192078056909f984fd75b0d11b6a2c04"
        ),
    ]
)
