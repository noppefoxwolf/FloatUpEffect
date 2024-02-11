import SwiftUI

public struct FloatUpView<Content: View, FloatUpContent: View>: View {
    public init(
        @ViewBuilder content: @escaping (@escaping () -> Void) -> Content,
        @ViewBuilder floatUpContent: @escaping () -> FloatUpContent
    ) {
        self.content = content
        self.floatUpContent = floatUpContent
    }
    
    @State
    var data: [FloatUpAnimationData] = []
    
    @ViewBuilder
    let content: (_ trigger: @escaping () -> Void) -> Content
    
    @ViewBuilder
    let floatUpContent: () -> FloatUpContent
    
    public var body: some View {
        content({
            data.append(FloatUpAnimationData.random)
        })
        .overlay {
            ForEach(data, id: \.id) { data in
                floatUpContent()
                    .floatup(data)
                    .onCompleteFloatupAnimation {
                        self.data.removeAll(where: { $0 == data })
                    }
            }
        }
    }
}
