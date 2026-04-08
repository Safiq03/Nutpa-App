import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeWebView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "laptopcomputer")
                }
                .tag(1)
            
            SupportView()
                .tabItem {
                    Label("Support", systemImage: "person.2.fill")
                }
                .tag(2)
        }
        .accentColor(AppTheme.primary)
        .ignoresSafeArea(.keyboard) // Only ignore keyboard to keep layout stable
    }
}

struct HomeWebView: View {
    @State private var isLoading = true
    @State private var canGoBack = false
    @State private var canGoForward = false
    
    let url = URL(string: "https://www.nutpa.in")!
    
    var body: some View {
        VStack(spacing: 0) {
            // Match the website's white header while ensuring it stays below the notch
            Color.white
                .frame(height: 1) // Safe area anchor
                .background(Color.white.ignoresSafeArea(edges: .top))
            
            // Subtle Progress Bar
            if isLoading {
                LinearProgressView()
                    .frame(height: 3)
            } else {
                Divider()
            }

            // The Web Content - Starts below the notch to prevent overlap
            WebViewWrapper(
                url: url,
                isLoading: $isLoading,
                canGoBack: $canGoBack,
                canGoForward: $canGoForward
            )
        }
        .background(Color.white.ignoresSafeArea())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
