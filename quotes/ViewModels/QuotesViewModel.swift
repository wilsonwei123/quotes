//
//  QuotesViewModel.swift
//  quotes
//
//  Created by Wilson Wei on 12/04/2025.
//

import Foundation

class QuotesViewModel: ObservableObject {
    let quoteModel: QuotesModel = QuotesModel()
    var possibleQOTDs = UserDefaults.standard.stringArray(forKey: "possibleQOTDs") ?? QuotesModel().quotes
    @Published var favouriteQuotes: [String] = UserDefaults.standard.stringArray(forKey: "favouriteQuotes") ?? []
    
    var getRandomQuote: String {
        get {
            return quoteModel.quotes[Int.random(in: 0..<quoteModel.quotes.count)]
        }
    }
    var getAllQuotes: [String] {
        get {
            return quoteModel.quotes
        }
    }
    func toggleFavourite(quote: String) {
        if let index = favouriteQuotes.firstIndex(of: quote) {
            favouriteQuotes.remove(at: index)
        } else {
            favouriteQuotes.append(quote)
        }
        UserDefaults.standard.set(favouriteQuotes, forKey: "favouriteQuotes")
    }
    func isFavourite(quote: String) -> Bool {
        if let index = favouriteQuotes.firstIndex(of: quote) {
            return true
        } else {
            return false
        }
    }
    private func QOTDHelperFunc() -> String {
        let QOTDIndex = Int.random(in: 0...possibleQOTDs.count - 1)
        let QOTD = possibleQOTDs[QOTDIndex]
        possibleQOTDs.remove(at: QOTDIndex)
        UserDefaults.standard.set(QOTD, forKey: "quoteOfTheDay")
        return QOTD
    }
    func getQuoteOfDay() -> (quote: String, date: String) {
        let currentDate = Date.now
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let currentDateString = dateFormatter.string(from: currentDate)
        let lastQuoteDate = UserDefaults.standard.string(forKey: "lastQuoteDate") ?? ""
        
        if lastQuoteDate == "" || currentDateString != lastQuoteDate {
            UserDefaults.standard.set(currentDateString, forKey: "lastQuoteDate")
            if possibleQOTDs.count > 0 {
                return (QOTDHelperFunc(), currentDateString)
            } else {
                possibleQOTDs = QuotesModel().quotes
                return (QOTDHelperFunc(), currentDateString)
            }
        } else {
            return (UserDefaults.standard.string(forKey: "quoteOfTheDay") ?? "No quote available", currentDateString)
        }
    }
}
