import SwiftUI

struct AppTheme {
    static let primary = Color(red: 0.0, green: 0.3, blue: 0.6) // Deep Royal Blue
    static let secondary = Color(red: 0.6, green: 0.6, blue: 0.6) // Metallic Silver
    static let accent = Color.blue
    static let background = Color.white
    static let darkBackground = Color(red: 0.05, green: 0.05, blue: 0.1)
    
    static let gradient = LinearGradient(
        gradient: Gradient(colors: [primary, primary.opacity(0.8)]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
