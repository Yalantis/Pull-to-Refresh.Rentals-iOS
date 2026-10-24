// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "YALPullToRefresh",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "YALPullToRefresh", targets: ["YALPullToRefresh"])
    ],
    targets: [
        .target(
            // Named differently from YALSunnyRefreshControl.h on purpose: SwiftPM treats a header named
            // like the target as an umbrella header and then rejects the Images.xcassets folder next to it.
            name: "YALPullToRefresh",
            path: "YALTourPullToRefresh/YALSunnyRefreshControll",
            resources: [
                .process("YALSunnyRefreshControl.xib"),
                .process("Images.xcassets")
            ],
            publicHeadersPath: "."
        )
    ]
)
