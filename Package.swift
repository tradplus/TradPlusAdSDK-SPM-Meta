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
            .exact("15.14.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Meta/releases/download/15.14.0/TPFacebookAdapter-15.14.0.xcframework.zip",
            checksum: "15c3d3ae24cd4b42c07db2e5c6bbe74712fb02349ae30b0ed0eb0f119af74df7"
        ),
    ]
)
