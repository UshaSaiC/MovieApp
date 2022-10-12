//
//  Package.swift
//  Movie
//
//  Created by Usha Sai Chintha on 12/10/22.
//
import PackageDescription

let package = Package(
    name: "Movie",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .plugin(
            name: "SwiftLint",
            targets: ["SwiftLint"])
    ],
    dependencies: [ .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.0.4")
    ],
    targets: [
        .target(
            name: "Movie",
            dependencies: [],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        ),
        .target(
            name: "MovieTests",
            dependencies: [],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
    ]
)
