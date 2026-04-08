import SwiftUI

struct ProductsView: View {
    let categories = [
        CategoryItem(name: "Laptops", icon: "laptopcomputer", color: .blue, url: "https://www.nutpa.in/products.html?cat=laptops"),
        CategoryItem(name: "Printers", icon: "printer.fill", color: .green, url: "https://www.nutpa.in/products.html?cat=printers"),
        CategoryItem(name: "Projectors", icon: "videoprojector.fill", color: .orange, url: "https://www.nutpa.in/products.html?cat=projectors"),
        CategoryItem(name: "Accessories", icon: "keyboard.fill", color: .purple, url: "https://www.nutpa.in/products.html?cat=accessories")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Professional Hardware")
                            .font(.largeTitle)
                            .bold()
                            .padding(.horizontal)
                        
                        Text("Enterprise-grade solutions for your business.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(categories) { category in
                                NavigationLink(destination: CategoryDetailView(category: category)) {
                                    CategoryCard(category: category)
                                }
                            }
                        }
                        .padding()
                        
                        // Featured Section
                        VStack(alignment: .leading) {
                            Text("Featured Brands")
                                .font(.headline)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(["HP", "Dell", "Lenovo", "Epson", "Apple"], id: \.self) { brand in
                                        BrandCircle(name: brand)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
    
    struct CategoryItem: Identifiable {
        let id = UUID()
        let name: String
        let icon: String
        let color: Color
        let url: String
    }
    
    struct CategoryCard: View {
        let category: CategoryItem
        
        var body: some View {
            VStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(category.color.opacity(0.1))
                        .frame(height: 100)
                    
                    Image(systemName: category.icon)
                        .font(.system(size: 40))
                        .foregroundColor(category.color)
                }
                
                Text(category.name)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(25)
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        }
    }
    
    struct BrandCircle: View {
        let name: String
        var body: some View {
            Text(name)
                .font(.caption)
                .bold()
                .padding()
                .frame(width: 80, height: 80)
                .background(Color(.systemGray6))
                .clipShape(Circle())
        }
    }
    
    struct CategoryDetailView: View {
        let category: CategoryItem
        @State private var isLoading = true
        
        var body: some View {
            ZStack {
                WebViewWrapper(
                    url: URL(string: category.url)!,
                    isLoading: $isLoading,
                    canGoBack: .constant(false),
                    canGoForward: .constant(false)
                )
                .navigationTitle(category.name)
                .navigationBarTitleDisplayMode(.inline)
                
                if isLoading {
                    ProgressView()
                }
            }
        }
    }
    
    struct ProductsView_Previews: PreviewProvider {
        static var previews: some View {
            ProductsView()
        }
    }
}
