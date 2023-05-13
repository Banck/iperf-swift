// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IperfSwift",
    products: [
        .library(
            name: "IperfSwift",
            targets: ["IperfCLib", "IperfSwift"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            name: "OpenSSL",
            url: "https://github.com/krzyzanowskim/OpenSSL",
            .upToNextMajor(from: "1.1.0")
        ),
    ],
    targets: [

        .target(
            name: "IperfCLib",
            dependencies: [.product(name: "OpenSSL", package: "OpenSSL")],
            path: "Sources/IperfCLib"
        ),
        .target(
            name: "IperfSwift",
            dependencies: ["IperfCLib"],
            path: "Sources/IperfSwift"
        ),
        .testTarget(
            name: "iperf-swiftTests",
            dependencies: ["IperfSwift"]
        ),
    ]
)
