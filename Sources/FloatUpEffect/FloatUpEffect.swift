import SwiftUI

public enum FleetingEffectDirection {
    case left
    case right
}

public struct FloatUpAnimationData: Identifiable, Equatable {
    public init(id: UUID, duration: Double, direction: FleetingEffectDirection, moveAreaSize: CGSize) {
        self.id = id
        self.duration = duration
        self.direction = direction
        self.moveAreaSize = moveAreaSize
    }
    
    public let id: UUID
    let duration: Double
    let direction: FleetingEffectDirection
    let moveAreaSize: CGSize
    
    public static var random: FloatUpAnimationData {
        FloatUpAnimationData(
            id: UUID(),
            duration: 3.0,
            direction: [.left, .right].randomElement()!,
            moveAreaSize: CGSize(
                width: Double.random(in: 0..<50),
                height: Double.random(in: 75..<100)
            )
        )
    }
}

public struct FloatUpEffect : GeometryEffect {
    let data: FloatUpAnimationData
    public var animatableData: Double
    
    public func effectValue(size: CGSize) -> ProjectionTransform {
        let directionValue = data.direction == .left ? 1.0 : -1.0
        let translationX = sin(animatableData * directionValue) * data.moveAreaSize.width
        let translationY = -(data.moveAreaSize.height) * animatableData
        let translation = CGAffineTransform(translationX: translationX, y: translationY)
        return ProjectionTransform(translation)
    }
}
