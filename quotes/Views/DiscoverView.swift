//
//  DiscoverView.swift
//  quotes
//
//  Created by Wilson Wei on 12/04/2025.
//

import SwiftUI

struct DiscoverView: View {
    @ObservedObject var quotesVM: QuotesViewModel
    @ObservedObject var colorsVM: ColorsViewModel
    @State var quotesList: [String]
    
    init(quotesVM: QuotesViewModel, colorsVM: ColorsViewModel) {
        quotesList = quotesVM.getAllQuotes
        self.quotesVM = quotesVM
        self.colorsVM = colorsVM
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
    }
    
    var body: some View {
        ZStack {
            colorsVM.colors.mainColor.ignoresSafeArea()
            VStack {
                ScrollView {
                    ForEach(quotesList, id: \.self) {quote in
                        HStack {
                            Text(quote)
                            .font(.system(size: 15))
                            .frame(maxWidth: 300, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .padding(10)
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
                .frame(maxWidth: 350)
                Spacer()
                Button(action: {
                    quotesList.shuffle()
                }, label: {
                    BlueButtonView(text: "Shuffle order")
                        .font(.callout)
                        .padding()
                })
            }
            .foregroundColor(colorsVM.colors.textColor)
        }
        .navigationTitle(Text("Discover"))
    }
}
