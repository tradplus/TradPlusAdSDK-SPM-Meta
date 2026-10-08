// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "TradPlusMetaAdapter",
    platforms: [
        .iOS(.v15),
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
            .exact("15.16.0")
        ),
        .package(
            url: "https://github.com/facebook/FBAudienceNetwork.git",
            .exact("6.22.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Meta/releases/download/15.16.0/TPFacebookAdapter-15.16.0.xcframework.zip",
            checksum: "08826eab113372c7c0b3e709208f13a6d03b610c5dc4bd6776949f82d24e30cd"
        ),
    ]
)
