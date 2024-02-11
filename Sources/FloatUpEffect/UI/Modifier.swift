import SwiftUI

struct FloatUpAnimatableModifier: ViewModifier {
    @State var time = 0.0
    
    let data: FloatUpAnimationData
    
    @Environment(\.floatupCompletion)
    var floatupCompletion
    
    func body(content: Content) -> some View {
        content
            .opacity(1 - (time / data.duration))
            .modifier(FloatUpEffect(data: data, animatableData: time))
            .onAppear(perform: {
                withAnimation(.linear(duration: data.duration), completionCriteria: .removed, {
                    self.time = data.duration
                }, completion: floatupCompletion)
            })
    }
}

private struct FloatupCompletionKey: EnvironmentKey {
    static let defaultValue: () -> Void = {}
}

extension EnvironmentValues {
    var floatupCompletion: () -> Void {
        get { self[FloatupCompletionKey.self] }
        set { self[FloatupCompletionKey.self] = newValue }
    }
}

extension View {
    @ViewBuilder
    public func floatup(_ data: FloatUpAnimationData = .random) -> some View {
        modifier(FloatUpAnimatableModifier(data: data))
    }
    
    @ViewBuilder
    public func onCompleteFloatupAnimation(_ completion: @escaping () -> Void) -> some View {
        environment(\.floatupCompletion, completion)
    }
}
