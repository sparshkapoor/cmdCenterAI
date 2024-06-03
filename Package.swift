// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cmdCenterAI",
    platforms: [ .visionOS(.v1)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "cmdCenterAI",
            targets: ["cmdCenterAI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sparshkapoor/ChatGPTSwiftHexWindows.git", from: "1.0.0"),
        .package(url: "https://github.com/alfianlosari/SiriWaveView", from: "1.0.0"),
        .package(url: "https://github.com/alfianlosari/GPTEncoder.git", exact: "1.0.4"),
        .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0"),
        .package(url: "https://github.com/swift-server/swift-openapi-async-http-client", from: "1.0.0"),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "cmdCenterAI",
            dependencies: [
                .product(name: "ChatGPTSwiftHexWindows", package: "ChatGPTSwiftHexWindows"),
                .product(name: "SiriWaveView", package: "SiriWaveView"),
                .product(name: "GPTEncoder", package: "GPTEncoder"),
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession",
                    condition: .when(platforms: [
                        .iOS, .macCatalyst, .macOS, .tvOS, .visionOS, .watchOS
                        ])),
            ]
        
        ),
        .testTarget(
            name: "cmdCenterAITests",
            dependencies: ["cmdCenterAI"]),
    ]
)
