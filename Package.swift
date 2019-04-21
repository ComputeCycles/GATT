// swift-tools-version:5.0
import PackageDescription

let prods: [Product] = [Product.library(name: "GATT", targets: ["GATT"])]
let deps: [Package.Dependency] = [
    .package(url: "https://github.com/ComputeCycles/BluetoothLinux", .branch("swift5")),
    .package(url: "https://github.com/ComputeCycles/Bluetooth", .branch("swift5"))
]
let targets: [Target] = [
    .target(name: "GATT", dependencies: ["BluetoothLinux", "Bluetooth"])
]

_ = Package(
    name: "GATT",
    products: prods,
    dependencies: deps,
    targets: targets,
    swiftLanguageVersions: [.v5]
)
