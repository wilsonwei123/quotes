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
    
    var body: some View {
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
            }
            .padding()
            .foregroundStyle(colorsVM.colors.textColor)
            .navigationBarTitle(Text("Home"))
        }
    }
}
