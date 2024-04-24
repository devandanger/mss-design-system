// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "design-system",
    platforms: [
        .iOS(.v16),
        .macOS(.v10_15),
        .watchOS(.v9),
        .tvOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "design-system",
            targets: ["design-system"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "design-system",
            resources: [
                .process("Sources/design-system/DesignTokens/Text")
//                .process("OpenDyslexic-Regular.otf"),
//                .process("OpenDyslexic-Italic.otf"),
//                .process("OpenDyslexic-Bold.otf"),
//                .process("OpenDyslexic-BoldItalic.otf")
            ]
        ),
        .testTarget(
            name: "design-systemTests",
            dependencies: ["design-system"]),
]
)
