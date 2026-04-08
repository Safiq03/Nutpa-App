import SwiftUI

struct SupportView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 30) {
                    // Header Image/Icon
                    ZStack {
                        Circle()
                            .fill(AppTheme.primary.opacity(0.1))
                            .frame(width: 150, height: 150)
                        
                        Image(systemName: "headphones.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .foregroundColor(AppTheme.primary)
                    }
                    .padding(.top, 40)
                    
                    VStack(spacing: 10) {
                        Text("How can we help?")
                            .font(.title)
                            .bold()
                        Text("Our Chennai-based experts are ready to assist your enterprise needs.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    
                    // Contact Options
                    VStack(spacing: 15) {
                        ContactRow(icon: "phone.fill", title: "Call Us", subtitle: "+91 9940428882", color: .blue) {
                            if let url = URL(string: "tel://9940428882") {
                                UIApplication.shared.open(url)
                            }
                        }
                        
                        ContactRow(icon: "message.fill", title: "Chat on WhatsApp", subtitle: "Instant Response", color: .green) {
                            if let url = URL(string: "https://wa.me/919940428882") {
                                UIApplication.shared.open(url)
                            }
                        }
                        
                        ContactRow(icon: "envelope.fill", title: "Email Sales", subtitle: "sales@nutpa.com", color: .red) {
                            if let url = URL(string: "mailto:sales@nutpa.com") {
                                UIApplication.shared.open(url)
                            }
                        }
                        
                        ContactRow(icon: "mappin.and.ellipse", title: "Visit Our Office", subtitle: "West Jafferkhanpet, Chennai", color: .orange) {
                            // Open in Maps
                            let address = "No 1/2, Janakiraman St, West Jafferkhanpet, Chennai — 600083"
                            let urlString = "http://maps.apple.com/?address=\(address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
                            if let url = URL(string: urlString) {
                                UIApplication.shared.open(url)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
    }
    
    struct ContactRow: View {
        let icon: String
        let title: String
        let subtitle: String
        let color: Color
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                HStack(spacing: 15) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(color.opacity(0.1))
                        Image(systemName: icon)
                            .foregroundColor(color)
                    }
                    .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
            }
        }
    }
    
    struct SupportView_Previews: PreviewProvider {
        static var previews: some View {
            SupportView()
        }
    }
}
