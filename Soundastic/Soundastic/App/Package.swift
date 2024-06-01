// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "App",
    platforms: [
      .iOS("16")
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "App",
            type: .dynamic,
            targets: ["App"]),
    ],
    dependencies: [
      .package(path: "../Theme")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "App",
            dependencies: [
              .product(name: "Theme", package: "Theme"),
              .product(name: "Components", package: "Theme")
            ]),
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]),
    ]
)
