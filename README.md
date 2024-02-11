# FloatupEffect

FloatupEffect is a simple and easy to use library for creating floating up effect for any view in Android. You can easily customize the floating up effect by changing the duration, distance, and direction of the floating up effect.

## Demo

![FloatupEffect]()

## Usage

```swift
FloatupView(content: {
    Button(action: $0, label: {
        Image(systemName: "heart.circle")
            .resizable()
            .frame(width: 44, height: 44)
    })
}, floatupContent: {
    Image(systemName: "heart.fill")
        .resizable()
        .foregroundStyle(.pink)
        .frame(width: 44, height: 44)
        .shadow(radius: 10)
})
```

## Installation

FloatupEffect is available through Swift Package Manager. To install it, simply add the following line to your Package.swift file:

```swift
dependencies: [
    .package(url: "", .upToNextMajor(from: "1.0.0"))
]
```

## License

FloatupEffect is available under the MIT license. See the LICENSE file for more info.