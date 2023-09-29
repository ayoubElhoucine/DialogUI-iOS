// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DialogUI",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "DialogUI",
            targets: ["DialogUI"]
        )
    ],
    targets: [
        .target(
            name: "DialogUI",
            path: "Sources"
        ),
        .testTarget(
            name: "DialogUITests",
            dependencies: ["DialogUI"],
            path: "Tests",
            exclude: ["CheckCocoaPodsQualityIndexes.rb"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
