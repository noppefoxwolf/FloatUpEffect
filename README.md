# FloatUpView

FloatUpView is a simple and easy to use library for creating floating up effect for any view in Android. You can easily customize the floating up effect by changing the duration, distance, and direction of the floating up effect.

## Demo

![](https://github.com/noppefoxwolf/FloatUpEffect/blob/main/.github/example.gif)

## Usage

```swift
FloatUpView(
    content: {
        Button(action: $0, label: {
            Image(systemName: "heart.circle")
                .resizable()
                .frame(width: 44, height: 44)
        })
    },
    floatUpContent: {
        Image(systemName: "heart.fill")
            .resizable()
            .foregroundStyle(.pink)
            .frame(width: 44, height: 44)
            .shadow(radius: 10)
    }
)
```

## Installation

FloatupEffect is available through Swift Package Manager. To install it, simply add the following line to your Package.swift file:

```swift
dependencies: [
    .package(url: "https://github.com/noppefoxwolf/FloatUpEffect", .upToNextMajor(from: "0.0.1"))
]
```

## License

FloatUpEffect is available under the MIT license. See the LICENSE file for more info.
