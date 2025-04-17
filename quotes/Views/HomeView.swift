//
//  ContentView.swift
//  quotes
//
//  Created by Wilson Wei on 11/04/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject public var quotesVM = QuotesViewModel()
    @StateObject public var colorsVM = ColorsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack() {
                colorsVM.colors.mainColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Favourites")
                            .font(.title)
                            .bold()
                    }
                    ScrollView {
                        ForEach(quotesVM.favouriteQuotes, id: \.self) { favQuote in
                            HStack {
                                Text("\(favQuote)\n")
                                    .font(.headline)
                                Spacer()
                                Button(action: {
                                    quotesVM.toggleFavourite(quote: favQuote)
                                }, label: {
                                    Image(systemName: "heart.fill")
                                        .padding(.leading, 22.5)
                                })
                            }
                            .frame(maxWidth: 350)
                        }
                    }
                    .frame(maxHeight: 400)
                    Spacer()
                    HStack {
                        NavigationLink(destination: DiscoverView(quotesVM: quotesVM, colorsVM: colorsVM), label: {
                            BlueButtonView(text: "Discover")
                                .font(.title3)
                        })
                        NavigationLink(destination: DailyQuoteView(quotesVM: quotesVM, colorsVM: colorsVM), label: {
                            BlueButtonView(text: "Quote of the day")
                                .font(.title3)
                        })
                        NavigationLink(destination: UserQuotesView(colorsVM: colorsVM), label: {
                            BlueButtonView(text: "My quotes")
                                .font(.title3)
                        })
                    }
                }
                .padding()
                .foregroundStyle(colorsVM.colors.textColor)
                .navigationBarTitle(Text("Home"))
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
    }
}

#Preview {
    HomeView()
}
