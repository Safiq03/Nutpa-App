Here is a quick summary of what the app does and how it works:

Hybrid Architecture: The app bridges high-fidelity native Swiftly views with a web-layer (WKWebView). It uses a customized WebViewWrapper integrated within SwiftUI state variables (isLoading, canGoBack, etc.) to surface dynamic pages from www.nutpa.in while keeping the shell fully native.
Startup & Main UI: It boots from NutpaApp.swift to a SplashScreenView which animates a welcome state before directing logic to MainView. The MainView hosts an explicitly configured TabView to ensure standard Apple tab bars are displayed correctly across all display modes.
Three Main Pillars:
Home: Loads the primary https://www.nutpa.in URL, hiding system components smoothly behind a custom, responsive LinearProgressView.
Products: A purely native view mapping hardware categories (Laptops, Printers, Projectors, Accessories) and enterprise brands. Tapping a category transitions via NavigationLink to specific localized web sections.
Support: Another native layout relying on deep links (like tel://, mailto:, and https://wa.me/) to instantly engage services with Apple-standard UI buttons.
Theme Integration: The overall premium aesthetic is regulated using AppTheme and NutpaDesignSystem, abstracting away specific hexadecimal arrays, spacing properties, and custom shadow constants.


This App Was Fully Developed by me with my knowledge. My name is Safiq and i m a Professional app developer.
