// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "App",
  platforms: [
    .iOS("17")
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "App",
      type: .dynamic,
      targets: ["App"]
    ),
    .library(
      name: "Home",
      type: .dynamic,
      targets: ["Home"]
    ),
    .library(
      name: "Login",
      type: .dynamic,
      targets: ["Login"]
    ),
  ],
  dependencies: [
    .package(path: "../Theme"),
    .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.5.1"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "App",
      dependencies: [
        .product(name: "Theme", package: "Theme"),
        .product(name: "Components", package: "Theme"),
        "Core",
        "Home",
        "Login",
        "Resolver"
      ]
    ),
    .target(
      name: "Core",
      dependencies: [
        "Resolver"
      ]
    ),
    .testTarget(
      name: "AppTests",
      dependencies: ["App"]
    ),
    .target(
      name: "Login",
      dependencies: [
        .product(name: "Theme", package: "Theme"),
        .product(name: "Components", package: "Theme"),
        "Core"
      ]
    ),
    .target(
      name: "Home",
      dependencies: [
        .product(name: "Theme", package: "Theme"),
        .product(name: "Components", package: "Theme"),
        "Core",
        "Login"
      ]
    ),
  ]
)
