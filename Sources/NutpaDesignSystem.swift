import SwiftUI

struct NutpaDesignSystem {
    // MARK: - Colors
    struct Colors {
        static let primary = Color(hex: "0F172A") // Deep Slate
        static let secondary = Color(hex: "3B82F6") // Vibrant Blue
        static let accent = Color(hex: "F59E0B") // Amber/Gold for premium feel
        static let background = Color(hex: "F8FAFC") // Light Gray/White
        static let textPrimary = Color(hex: "1E293B")
        static let textSecondary = Color(hex: "64748B")
        static let cardBackground = Color.white
        static let glass = Color.white.opacity(0.7)
    }
    
    // MARK: - Shadows
    struct Shadows {
        static let soft = Shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        static let sharp = Shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

struct Shadow {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
