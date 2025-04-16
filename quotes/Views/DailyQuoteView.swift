//
//  DailyQuoteView.swift
//  quotes
//
//  Created by Wilson Wei on 15/04/2025.
//

import SwiftUI

struct DailyQuoteView: View {
    @ObservedObject var quotesVM: QuotesViewModel
    @ObservedObject var colorsVM: ColorsViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                colorsVM.colors.mainColor.ignoresSafeArea()
                VStack {
                    Text("\(quotesVM.getQuoteOfDay().date)\n")
                        .font(.title)
                        .bold()
                    Text(quotesVM.getQuoteOfDay().quote)
                        .font(.largeTitle)
                        .bold()
                    Button(action: {
                        quotesVM.toggleFavourite(quote: quotesVM.getQuoteOfDay().quote)
                    }, label: {
                        if quotesVM.isFavourite(quote: quotesVM.getQuoteOfDay().quote) {
                            Image(systemName: "heart.fill")
                                .imageScale(.large)
                                .padding()
                        } else {
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .padding()
                        }
                    })
                    Spacer()
                }
                .foregroundStyle(colorsVM.colors.textColor)
                .padding()
                .navigationTitle("Quote Of The Day")
            }
        }
    }
}

#Preview {
    DailyQuoteView(quotesVM: QuotesViewModel(), colorsVM: ColorsViewModel())
}
