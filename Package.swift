// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ThriftFinder",
    products: [
        .library(
            name: "ThriftFinder",
            targets: ["ThriftFinder"]),
    ],
    dependencies: [
        .package(path: "../ThriftBase"),
    ],
    targets: [
        .target(
            name: "ThriftFinder",
            dependencies: ["ThriftBase"]),
        .testTarget(
            name: "ThriftFinderTests",
            dependencies: ["ThriftFinder", "ThriftBase"]),
    ]
)
