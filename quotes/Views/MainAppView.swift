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
    init() {
            UITabBar.appearance().tintColor = UIColor.systemBlue

            UITabBar.appearance().unselectedItemTintColor = UIColor.gray.withAlphaComponent(0.8)
        }
    var body: some View {
        TabView {
            NavigationStack {
                HomeView(quotesVM: quotesVM, colorsVM: colorsVM)
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
            .tabItem {
                Label("Home", systemImage: "house")
            }
            NavigationStack {
                FavouritesView(quotesVM: quotesVM, colorsVM: colorsVM)
            }
            .tabItem {
                Label("Favourites", systemImage: "heart.fill")
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
    }
}

#Preview {
    MainAppView()
}
