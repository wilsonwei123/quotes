//
//  ContentView.swift
//  quotes
//
//  Created by Wilson Wei on 11/04/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject public var quotesVM: QuotesViewModel
    @ObservedObject public var colorsVM: ColorsViewModel
    var featuredM = FeaturedQuotesModel()
    var body: some View {
        ZStack() {
            colorsVM.colors.mainColor.ignoresSafeArea()
            VStack {
                Text("Featured Quotes\n")
                    .bold()
                    .font(.title)
                ScrollView {
                    ForEach(featuredM.featuredQuotes, id: \.self) { quote in
                        HStack {
                            Text("\(quote)\n")
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                quotesVM.toggleFavourite(quote: quote)
                            }, label: {
                                if quotesVM.isFavourite(quote: quote) {
                                    Image(systemName: "heart.fill")
                                        .padding()
                                } else {
                                    Image(systemName: "heart")
                                        .padding()
                                }
                            })
                        }
                    }
                }
            }
            .padding()
            .foregroundStyle(colorsVM.colors.textColor)
            .navigationBarTitle(Text("Home"))
        }
    }
}
