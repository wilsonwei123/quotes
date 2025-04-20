//
//  MainAppView.swift
//  quotes
//
//  Created by Wilson Wei on 20/04/2025.
//

import SwiftUI

struct MainAppView: View {
    @StateObject var quotesVM = QuotesViewModel()
    @StateObject var colorsVM = ColorsViewModel()
    var body: some View {
        TabView {
            NavigationStack {
                HomeView(quotesVM: quotesVM, colorsVM: colorsVM)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            NavigationStack {
                DiscoverView(quotesVM: quotesVM, colorsVM: colorsVM)
            }
            .tabItem {
                Label("Discover", systemImage: "magnifyingglass")
            }
            NavigationStack {
                DailyQuoteView(quotesVM: quotesVM, colorsVM: colorsVM)
            }
            .tabItem {
                Label("Quote of the day", systemImage: "sun.max")
            }
            NavigationStack {
                UserQuotesView(colorsVM: colorsVM)
            }
            .tabItem {
                Label("My quotes", systemImage: "quote.bubble")
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SettingsView(colorsVM: colorsVM), label: {
                    Image(systemName: "gear")
                        .imageScale(.large)
                        .font(.title2)
                })
            }
        }
    }
}

#Preview {
    MainAppView()
}
