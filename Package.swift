// swift-tools-version:5.0
import PackageDescription

#if os(Linux) || xcompile

let prods: [Product] = [Product.library(name: "GATT", targets: ["GATT"])]
let deps: [Package.Dependency] = [
    .package(url: "https://github.com/ComputeCycles/BluetoothLinux", .branch("swift5")),
    .package(url: "https://github.com/ComputeCycles/Bluetooth", .branch("swift5"))
]
let targets: [Target] = [
    .target(name: "GATT", dependencies: ["BluetoothLinux", "Bluetooth"])
]

#elseif os(macOS)

let prods: [Product] = [Product.library(name: "DarwinGATT", targets: ["DarwinGATT"])]
let deps: [Package.Dependency] = [
    .package(url: "https://github.com/ComputeCycles/BluetoothDarwin", .branch("swift5")),
    .package(url: "https://github.com/ComputeCycles/Bluetooth", .branch("swift5"))
]
let targets: [Target] = [
    .target(name: "GATT", dependencies: ["BluetoothDarwin", "Bluetooth"]),
    .target(name: "DarwinGATT", dependencies: ["GATT"])
]

#endif

_ = Package(
    name: "GATT",
    products: prods,
    dependencies: deps,
    targets: targets,
    swiftLanguageVersions: [.v5]
)
