import SwiftUI
import FloatUpEffect

@main
struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
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
        }
    }
}
