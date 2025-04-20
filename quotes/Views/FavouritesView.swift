//
//  FavouritesView.swift
//  quotes
//
//  Created by Wilson Wei on 20/04/2025.
//

import SwiftUI

struct FavouritesView: View {
    @ObservedObject var quotesVM: QuotesViewModel
    @ObservedObject var colorsVM: ColorsViewModel
    var body: some View {
        ZStack {
            colorsVM.colors.mainColor.ignoresSafeArea()
            ScrollView {
                Text("\n")
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
            .foregroundStyle(colorsVM.colors.textColor)
        }
        .navigationBarTitle("Favourites")
    }
}

#Preview {
    FavouritesView(quotesVM: QuotesViewModel(), colorsVM: ColorsViewModel())
}
