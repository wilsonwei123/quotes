//
//  UserQuotesModel.swift
//  quotes
//
//  Created by Wilson Wei on 16/04/2025.
//

import Foundation

struct UserQuotesModel {
    var userQuotes: [String] = UserDefaults.standard.stringArray(forKey: "userQuotes") ?? []
}
