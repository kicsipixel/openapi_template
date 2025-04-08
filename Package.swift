// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "{{HB_PACKAGE_NAME}}",
  platforms: [.macOS(.v14), .iOS(.v17), .tvOS(.v17)],
  products: [
    .executable(name: "{{HB_EXECUTABLE_NAME}}", targets: ["{{HB_EXECUTABLE_NAME}}"])
  ],
  dependencies: [
    .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.11.0"),
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"),
    // OpenAPI
    .package(url: "https://github.com/apple/swift-openapi-generator.git", from: "1.2.0"),
    .package(url: "https://github.com/apple/swift-openapi-runtime.git", from: "1.3.0"),
    .package(url: "https://github.com/swift-server/swift-openapi-hummingbird.git", from: "2.0.0"),
    // Database
  ],
  targets: [
    .target(
      name: "APIService",
      dependencies: [
        .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
      ],
      plugins: [
        .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator")
      ]
    ),
    .executableTarget(
      name: "{{HB_EXECUTABLE_NAME}}",
      dependencies: [
        .target(name: "APIService"),
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        .product(name: "Hummingbird", package: "hummingbird"),
        // OpenAPI
        .product(name: "OpenAPIHummingbird", package: "swift-openapi-hummingbird"),
        // Database
      ],
      path: "Sources/App"
    ),
    .testTarget(
      name: "{{HB_EXECUTABLE_NAME}}Tests",
      dependencies: [
        .byName(name: "{{HB_EXECUTABLE_NAME}}"),
        .product(name: "HummingbirdTesting", package: "hummingbird"),
      ],
      path: "Tests/AppTests"
    ),
  ]
)
