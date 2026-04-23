// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MaterialDesignColor",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "MaterialDesignColor",
      targets: ["MaterialDesignColor"]),
    .library(
      name: "MaterialDesignColorCore",
      targets: ["MaterialDesignColorCore"]),
    .library(
      name: "MaterialDesignColorSwiftUI",
      targets: ["MaterialDesignColorSwiftUI"]),
    .library(
      name: "MaterialDesignColorUIKit",
      targets: ["MaterialDesignColorUIKit"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "MaterialDesignColor",
      dependencies: ["MaterialDesignColorSwiftUI"],
      path: "packages/ios/Sources/MaterialDesignColor"),
    .target(
      name: "MaterialDesignColorCore",
      dependencies: [],
      path: "packages/ios/Sources/MaterialDesignColorCore"),
    .target(
      name: "MaterialDesignColorSwiftUI",
      dependencies: ["MaterialDesignColorCore"],
      path: "packages/ios/Sources/MaterialDesignColorSwiftUI"),
    .target(
      name: "MaterialDesignColorUIKit",
      dependencies: ["MaterialDesignColorCore"],
      path: "packages/ios/Sources/MaterialDesignColorUIKit"),
    .testTarget(
      name: "MaterialDesignColorCoreTests",
      dependencies: ["MaterialDesignColorCore"],
      path: "packages/ios/Tests/MaterialDesignColorCoreTests"),
    .testTarget(
      name: "MaterialDesignColorCompatibilityTests",
      dependencies: ["MaterialDesignColor"],
      path: "packages/ios/Tests/MaterialDesignColorCompatibilityTests")
  ]
)
