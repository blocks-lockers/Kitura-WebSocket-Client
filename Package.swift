// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

/*
* Copyright IBM Corporation and the Kitura project authors 2019-2020
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import PackageDescription

let package = Package(
    name: "KituraWebSocketClient",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "KituraWebSocketClient",
            targets: ["KituraWebSocketClient"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Kitura/Kitura-WebSocket-NIO", .branch("master")),
        .package(url: "https://github.com/Kitura/Kitura-NIO.git", from: "2.4.200"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.8.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-nio-extras.git", from: "1.3.1"),
        .package(url: "https://github.com/Kitura/Kitura-WebSocket-Compression.git", from: "0.1.200"),
        .package(url: "https://github.com/Kitura/LoggerAPI.git", from: "1.9.200")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "KituraWebSocketClient",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOFoundationCompat", package: "swift-nio"),
                .product(name: "NIOHTTP1", package: "swift-nio"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
                .product(name: "NIOWebSocket", package: "swift-nio"),
                .product(name: "NIOConcurrencyHelpers", package: "swift-nio"),
                .product(name: "NIOExtras", package: "swift-nio-extras"),
                .product(name: "WebSocketCompression", package: "Kitura-WebSocket-Compression"),
                .product(name: "Kitura-WebSocket", package: "Kitura-WebSocket-NIO"),
            ]
        ),
    ]
)
