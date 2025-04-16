//
//  UserQuotesViewModel.swift
//  quotes
//
//  Created by Wilson Wei on 16/04/2025.
//

import Foundation

class UserQuotesViewModel: ObservableObject {
    @Published private var userQuotesModel = UserQuotesModel()
    
    var getUserQuotes: [String] {
        get {
            return userQuotesModel.userQuotes
        }
    }
    func addUserQuote(newQuote: String) {
        userQuotesModel.userQuotes.append(newQuote)
        UserDefaults.standard.set(userQuotesModel.userQuotes, forKey: "userQuotes")
    }
    func removeUserQuote(quote: String) {
        if userQuotesModel.userQuotes.contains(quote) {
            if let index = userQuotesModel.userQuotes.firstIndex(of: quote) {
                userQuotesModel.userQuotes.remove(at: index)
            }
        }
        UserDefaults.standard.set(userQuotesModel.userQuotes, forKey: "userQuotes")
    }
}
