import SwiftUI

enum KRYTheme {
    static let background = LinearGradient(
        colors: [
            Color(red: 1.0, green: 0.96, blue: 0.94),
            Color(red: 0.96, green: 0.96, blue: 1.0),
            Color(red: 0.94, green: 1.0, blue: 0.98)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let card = Color.white.opacity(0.72)
    static let accent = Color(red: 0.91, green: 0.42, blue: 0.55)
}
