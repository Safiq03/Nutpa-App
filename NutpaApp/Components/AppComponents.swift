import SwiftUI

struct LinearProgressView: View {
    @State private var position: CGFloat = -1.0
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Color.blue.opacity(0.1)
                Color.blue
                    .frame(width: geo.size.width * 0.4)
                    .offset(x: position * geo.size.width)
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                position = 1.0
            }
        }
    }
}

struct WhatsAppFAB: View {
    var body: some View {
        Button(action: {
            if let url = URL(string: "https://wa.me/919940428882?text=Hi Nutpa, I'm using your iOS app and have a query.") {
                UIApplication.shared.open(url)
            }
        }) {
            ZStack {
                Circle()
                    .fill(Color(red: 0.15, green: 0.68, blue: 0.38)) // WhatsApp Green
                    .frame(width: 60, height: 60)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                
                Image(systemName: "message.fill")
                    .foregroundColor(.white)
                    .font(.title2)
            }
        }
    }
}
