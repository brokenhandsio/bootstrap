// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Bootstrap",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(name: "Bootstrap", targets: ["Bootstrap"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "Bootstrap", 
            dependencies: [
                .product(name: "Leaf", package: "leaf"),
                .product(name: "Vapor", package: "vapor")
            ]),
        .testTarget(name: "BootstrapTests", dependencies: ["Bootstrap"])
    ]
)
