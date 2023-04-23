// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "leaf-bootstrap",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(name: "LeafBootstrap", targets: ["LeafBootstrap"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "LeafBootstrap",
            dependencies: [
                .product(name: "Leaf", package: "leaf"),
                .product(name: "Vapor", package: "vapor")
            ]),
        .testTarget(
            name: "LeafBootstrapTests",
            dependencies: [
                .target(name: "LeafBootstrap"),
                .product(name: "XCTVapor", package: "vapor")
            ]
        )
    ]
)
