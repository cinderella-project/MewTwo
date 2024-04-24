// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "MewTwo",
    products: [
        .library(name: "Mew", targets: ["Mew"])
    ],
    targets: [
        .target(name: "Mew"),
        .testTarget(name: "MewTests", dependencies: [.byName(name: "Mew")]),
    ]
)
