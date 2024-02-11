import SwiftUI

public struct FloatupView<Content: View, FloatupContent: View>: View {
    public init(
        @ViewBuilder content: @escaping (@escaping () -> Void) -> Content,
        @ViewBuilder floatupContent: @escaping () -> FloatupContent
    ) {
        self.content = content
        self.floatupContent = floatupContent
    }
    
    @State
    var data: [FloatUpAnimationData] = []
    
    @ViewBuilder
    let content: (_ trigger: @escaping () -> Void) -> Content
    
    @ViewBuilder
    let floatupContent: () -> FloatupContent
    
    public var body: some View {
        content({
            data.append(FloatUpAnimationData.random)
        })
        .overlay {
            ForEach(data, id: \.id) { data in
                floatupContent()
                    .floatup(data)
                    .onCompleteFloatupAnimation {
                        self.data.removeAll(where: { $0 == data })
                    }
            }
        }
    }
}
